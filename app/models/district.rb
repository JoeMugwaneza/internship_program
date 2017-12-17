class District < ApplicationRecord
  belongs_to :province
  has_many :employers
  has_many :applications
  has_many :sectors, :dependent => :destroy

  def self.options_for_select
    order('LOWER(name)').map {|e|[e.name, e.id]}
  end
end
