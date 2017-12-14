class District < ApplicationRecord
  belongs_to :province
  has_many :employers
  has_many :applications
  has_many :sectors, :dependent => :destroy
end
