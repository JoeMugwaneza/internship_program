class AddEmailToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :email, :string
    add_column :employers, :district, :string
    add_column :employers, :sector, :string
  end
end
