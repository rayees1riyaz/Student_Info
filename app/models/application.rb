class Application < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :name, presence:true
  validates :phone_number, presence:true, length: {minimum:10, maximum:13}, uniqueness: true
  validates :dob, presence:true
  after_create :set_application_number
  private

  def set_application_number
    update(application_number: "APP#{Time.current.year}-#{id}")
  end
end
