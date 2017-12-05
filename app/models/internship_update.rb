class InternshipUpdate < ApplicationRecord
  belongs_to :application
  belongs_to :chain_value
  belongs_to :employer


  validates_uniqueness_of :application_id

end
