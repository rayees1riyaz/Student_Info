class StudentsController < ApplicationController
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
end
