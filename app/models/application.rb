class Application < ApplicationRecord
  belongs_to :user

  belongs_to :bank
  belongs_to :field_of_study


  

  def gender
    if self.is_female == true
      return "Female"
    elsif self.is_female == false
      return "Male"
    else
      return "Unspecified"
    end
  end
end
