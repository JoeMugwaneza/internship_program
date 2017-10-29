class AddIsFemaleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_female, :boolean, :default => nil
  end
end
