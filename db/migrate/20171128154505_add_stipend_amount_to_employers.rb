class AddStipendAmountToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :stipend_amount, :decimal, precision:7, scale: 2
    add_column :internship_updates, :employer_id, :integer
  end
end
