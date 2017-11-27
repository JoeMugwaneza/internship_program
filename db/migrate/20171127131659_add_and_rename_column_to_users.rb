class AddAndRenameColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :cell, :bank_name
    rename_column :users, :college, :bank_number
    add_column :users, :internship_placement, :boolean, :default => false

  end
end
