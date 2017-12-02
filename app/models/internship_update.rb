class InternshipUpdate < ApplicationRecord
  belongs_to :application
  belongs_to :chain_value
  belongs_to :employer
end
