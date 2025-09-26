class CoursesController < ApplicationController
def show
     @course= Course.find(params[:id])
end  

  def search
 
  end

def search_by_id
     @course = Course.find_by(id: params[:course_id])
     if @course 
     redirect_to course_path(@course), notice: "Course found!"

     else
      redirect_to courses_search_path, alert: "Please Select Course"
end
end

end 


