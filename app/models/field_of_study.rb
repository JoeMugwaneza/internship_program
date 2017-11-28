class FieldOfStudy < ApplicationRecord
  belongs_to :employer
  belongs_to :user
end
