class FieldOfStudy < ApplicationRecord
  has_many :users
  has_many :employer_fields
  has_many :employers, through: :employer_fields
  has_many :applications
end
