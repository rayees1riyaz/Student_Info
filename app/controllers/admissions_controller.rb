class AdmissionsController < ApplicationController
def show
     @admission= Admission.find(params[:id])
end  

  def search
 
  end

def search_by_id
     @admission = Admission.find_by(admission_number: params[:admission_number])
     if @admission 
     redirect_to admission_path(@admission), notice: "Admission found!"
     else
    redirect_to admissions_search_path, alert: "Admission ID not found"
end
end

end 

