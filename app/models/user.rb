class User < ApplicationRecord
    has_secure_password
    has_many :applications, dependent: :destroy
     
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :dob, presence: true
  validates :registration_number, uniqueness: true, allow_nil: true

    after_create :generate_registration_number

  private

  def generate_registration_number
    update(registration_number: "KUP#{Time.current.year}-#{id}")
  end
end
