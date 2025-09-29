class StudentsController < ApplicationController
  before_action :require_admin
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @courses = Course.all
  end


  def create

    @student = Student.new(student_params)

    if @student.save
     
      @admission = Admission.new
      @admission.student_id = @student.id
      @admission.course_id = params[:student][:course_id]
      @admission.fee = rand(10000..30000)
      @admission.date_of_joining = Time.current
      @admission.save

      redirect_to @student, notice: "Admission Created Successfully"
    else
     
      @courses = Course.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  private


  def student_params
    params.require(:student).permit(:name, :phone_number, :dob)
  end
   def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "Only admins can perform this action!"
    end
  end
end
