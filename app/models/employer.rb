class Employer < ApplicationRecord
  belongs_to :chain_value
  belongs_to :sector
  belongs_to :district
  
  has_many :employer_fields
  has_many :field_of_studies, through: :employer_fields
  scope :pending_request, -> {where(closed: false)}
  scope :confirmed_request, -> {where(closed: true)}
  
end
