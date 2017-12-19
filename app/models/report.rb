class Report < ApplicationRecord
  belongs_to :user
  has_many :challenges
  has_many :results
  has_many :solutions
  has_many :key_activities

  accepts_nested_attributes_for :challenges, :allow_destroy => true
  accepts_nested_attributes_for :results, :allow_destroy => true
  accepts_nested_attributes_for :solutions, :allow_destroy => true
  accepts_nested_attributes_for :key_activities, :allow_destroy => true
end
