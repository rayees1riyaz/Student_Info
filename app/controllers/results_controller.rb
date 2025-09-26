class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])    
      @student = @result.student                
    @results = Result.where(student_id: @student.id)

  end

  def search
  end

  def search_by_id

  @student = Student.find_by(student_number: params[:student_number])

  if @student

    @results = Result.where(student_id: @student.id)

    if @results.any?
      redirect_to result_path(@results.first), notice: "Result found!"
    else
      redirect_to results_search_path, alert: "No results found for this student."
    end
  else
    redirect_to results_search_path, alert: "Student not found."
  end
end

end
