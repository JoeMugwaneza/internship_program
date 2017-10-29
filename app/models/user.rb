class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


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
