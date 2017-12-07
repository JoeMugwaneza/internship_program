class InternshipUpdate < ApplicationRecord
  belongs_to :application
  belongs_to :chain_value
  belongs_to :employer


  validates_uniqueness_of :application_id

  def expected_end
    range_time = self.starting_at + 6.months
    expect_end = range_time.strftime("%B %d, %Y")
  end
 
  def remaining_time
    range_time = self.starting_at + 6.months
    counting_days = (range_time.to_date - Date.current).to_i
    remaining_months = counting_days / 30
    remaining_days = counting_days % 30

    if remaining_days == 1 

      return "#{remaining_months} months and  #{remaining_days} day"
    elsif remaining_days == 0
      return  "#{remaining_months} months"
    else
      return "#{remaining_months} months and  #{remaining_days} days"
    end
  end
end
