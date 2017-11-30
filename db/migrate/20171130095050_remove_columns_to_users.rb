class RemoveColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :district, :string
    remove_column :users, :sector, :string
    remove_column :users, :bank_id, :integer
    remove_column :users, :bank_number, :string
    remove_column :users, :phone_number, :string
    remove_column :users, :is_female, :boolean
    remove_column :users, :internship_placement, :boolean
    remove_column :users, :field_of_study_id, :integer
  end
end
