class AddClosedToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :closed, :boolean, :default => false
  end
end
