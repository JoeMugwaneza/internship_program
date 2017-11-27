class InternshipUpdate < ApplicationRecord
  belongs_to :user
  has_one :chain_value
end
