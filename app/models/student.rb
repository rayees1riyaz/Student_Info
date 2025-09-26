class Student < ApplicationRecord
has_one :admission, dependent: :destroy
  has_many :results, dependent: :destroy
  validates :name, presence:true
  validates :phone_number, presence:true, length: {minimum:10, maximum:13}, uniqueness: true
  validates :dob, presence:true

  after_create :set_student_id
  private

  def set_student_id
     update(student_number: "STU#{Time.current.year}-#{id}")
   
  end
end