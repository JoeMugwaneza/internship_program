class Sector < ApplicationRecord
  has_many :applications
  has_many :employers
  belongs_to :district
end
