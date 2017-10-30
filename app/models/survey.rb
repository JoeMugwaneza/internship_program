class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, :dependent => :destroy
  # has_many :answers, through: :questions

   accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
