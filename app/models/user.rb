class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :surveys, :dependent => :destroy
  has_many :answers, through: :surveys
  has_one :internship_update
  
  attr_accessor :login

  validates :first_name, presence: {message: "must be filled"}
  validates :last_name, presence: {message: "must be filled"}
  validates :id_number, numericality: {message: "will have to be 16"}
  validates :college, presence: {message: "must be filled"}
  validates :field_of_studies, presence: {message: "must be filled"}
  validates :district, presence: {message: "must be filled"}
  validates :sector, presence: {message: "must be filled"}
  validates :cell, presence: {message: "must be filled"}
  validates :tel, presence: {message: "must be filled"}

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


  rails_admin do
    # configure :reset_password
    list do
      include_fields :first_name, :last_name, :email, :admin, :id_number, :district, :sector, :cell, :tel, :college, :field_of_studies, :is_female
    end
    edit do
      exclude_fields :id, :encrypted_password, :created_at, :updated_at, :remember_created_at, :sign_in_count , :current_sign_in_at, :reset_password_token, :reset_password_sent_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
      # include_fields :reset_password
    end
  end

end
