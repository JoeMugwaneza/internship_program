class AddChainValueIdToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :chain_value_id, :integer
    remove_column :users, :bank_name, :string
    add_column :users, :bank_id, :integer
    remove_column :users, :field_of_studies, :string
    add_column :users, :field_of_study_id, :integer
    rename_column :users, :tel, :phone_number
  end
end
