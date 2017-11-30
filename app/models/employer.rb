class Employer < ApplicationRecord
  belongs_to :chain_value
  
  has_many :employer_fields
  has_many :field_of_studies, through: :employer_fields

  
end
