class CreateEmployers < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :company_name
      t.string :company_website
      t.datetime :available_at
      t.integer :number_of_interns

      t.timestamps
    end
  end
end
