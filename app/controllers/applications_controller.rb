class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :approve, :reject]
  before_action :require_student_login, only: [:new, :create]

  def index
    @applications = Application.all
  end


  def new
    if current_user.applications.exists?
      redirect_to applications_path, alert: " You have already applied!"
    else
      @application = Application.new
      @courses = Course.all
    end
  end

  def create
    if current_user.applications.exists?
      redirect_to applications_path, alert: " You have already applied!"
      return
    end

    @application = current_user.applications.build(application_params)
    @courses = Course.all 

    if @application.save
      redirect_to index_path, notice: "Application submitted successfully! Your Application Number is #{@application.application_number}"
    else
      render :new, status: :unprocessable_entity
    end
  end

 
  def approve
    @application.update(status: "approved")

  student = Student.create(
  name: @application.name,
  phone_number: @application.phone_number,
  dob: @application.dob,

  )

    admission = Admission.create(
      student_id: student.id,
      course_id: @application.course_id,
      fee: rand(10000..30000),
      date_of_joining: Time.current
    )

    redirect_to applications_path, notice: "Application approved!"
  end

 
  def reject
    @application.update(status: "rejected")
    redirect_to applications_path, notice: "Application rejected!"
  end


  def show
    @student = Student.find_by(user_id: @application.user_id)
    @admission = Admission.find_by(student_id: @student&.id, course_id: @application.course_id)
  end


  def search
  end

  def search_by_id
    @application = Application.find_by(application_number: params[:application_number])
    if @application
      redirect_to application_path(@application), notice: "Application found!"
    else
      redirect_to applications_search_path, alert: "Application not found"
    end
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(:name, :phone_number, :dob, :course_id)
  end

  def require_student_login
    unless current_user.present?
      redirect_to student_login_path, alert: " You must login first to apply for admission."
    end
  end
end
