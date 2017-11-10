class Survey < ApplicationRecord
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :answers, :allow_destroy => true

  rails_admin do
    list do
      include_fields :name, :created_at, :updated_at
    end
    edit do 
      exclude_fields :User, :answers
    end
  end
end
