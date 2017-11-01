class Survey < ApplicationRecord
  belongs_to :user
  has_many :answers, :dependent => :destroy
   validates :name, presence: true

   accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
