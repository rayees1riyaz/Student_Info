class ApplicationsController < ApplicationController

  before_action :require_login

  before_action :set_application, only: [:show, :approve, :reject, :destroy]

  before_action :require_student, only: [:new, :create]

  before_action :require_admin, only: [:approve, :reject, :destroy]

  def index
    if current_user.admin?
      @applications = Application.all
    else
      @applications = current_user.applications
    end
  end

  def new
    if current_user.applications.exists?
      redirect_to applications_path, alert: "You have already applied!"
    else
      @application = Application.new
      @courses = Course.all
    end
  end

  # Create a new application
  def create
    if current_user.applications.exists?
      redirect_to applications_path, alert: "You have already applied!"
      return
    end

    @application = current_user.applications.build(application_params)
    @courses = Course.all 

    if @application.save
      redirect_to applications_path, notice: "Application submitted! Your Application Number: #{@application.application_number}"
    else
      render :new
    end
  end

  # Approve an application
  def approve
    @application.update(status: "approved")

    # Create student record
    student = Student.create(
      name: @application.name,
      phone_number: @application.phone_number,
      dob: @application.dob,
      application_id: @application.id
    )

 
    Admission.create(
      student_id: student.id,
      course_id: @application.course_id,
      fee: rand(10000..30000),
      date_of_joining: Time.current,
      application_id: @application.id
    )

    redirect_to applications_path, notice: "Application approved!"
  end

  def reject
    @application.update(status: "rejected")
    redirect_to applications_path, notice: "Application rejected!"
  end


  def destroy
    @application.destroy
    redirect_to applications_path, notice: "Application deleted!"
  end

  def show
    @student = Student.find_by(application_id: @application.id)
    @admission = Admission.find_by(student_id: @student&.id, course_id: @application.course_id)
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end


  def application_params
    params.require(:application).permit(:name, :phone_number, :dob, :course_id)
  end

  def require_login
    unless current_user
      redirect_to student_login_path, alert: "You must log in first!"
    end
  end


  def require_student
    unless current_user && !current_user.admin?
      redirect_to root_path, alert: "Only students can apply!"
    end
  end


  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "Only admins can perform this action!"
    end
  end
end
