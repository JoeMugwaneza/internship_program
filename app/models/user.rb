class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :surveys, :dependent => :destroy
  has_many :answers, through: :surveys
  
  attr_accessor :login

  validates :id_number,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  def login=(login)
    @login = login
  end

  def login
    @login || self.id_number || self.email
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(id_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:id_number) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end


  end


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
