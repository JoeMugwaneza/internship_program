class District < ApplicationRecord
  has_many :employers
  has_many :applications
  has_many :sectors
end
