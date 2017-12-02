class Application < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  belongs_to :field_of_study
  has_one :internship_update

  scope :got_internship, -> {where(internship_placement: true)}
  scope :looking_internship, -> {where(internship_placement: false) }



  

  def gender
    if self.is_female == true
      return "Female"
    elsif self.is_female == false
      return "Male"
    else
      return "Unspecified"
    end
  end

  def self.districts
     Application.all
  end
end
