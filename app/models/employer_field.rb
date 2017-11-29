class EmployerField < ApplicationRecord
  belongs_to :employer
  belongs_to :field_of_study
end
