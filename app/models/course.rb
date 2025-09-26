class Course < ApplicationRecord
  has_many :admissions
  has_many :applications
end
