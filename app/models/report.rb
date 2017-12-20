class Report < ApplicationRecord
  belongs_to :user
  has_many :challenges
  has_many :results
  has_many :solutions
  has_many :key_activities

  accepts_nested_attributes_for :challenges, :reject_if => lambda { |a| a[:challenge_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :results, :reject_if => lambda { |a| a[:result_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :solutions, :reject_if => lambda { |a| a[:solution_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :key_activities, :reject_if => lambda { |a| a[:activity_name].blank? }, :allow_destroy => true
end
