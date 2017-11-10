class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :survey

  validates :content, length: { minimum: 10 }
end
