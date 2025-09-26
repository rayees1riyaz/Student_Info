class Admission < ApplicationRecord
  belongs_to :student
  belongs_to :course
  after_create :set_admission_number
  private

  
def set_admission_number
  update(admission_number: "ADM#{Time.current.year}-#{id}")
end
end
