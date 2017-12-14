class AddColumnToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :district_id, :integer
    add_column :applications, :sector_id, :integer
    add_column :employers, :district_id, :integer
    add_column :employers, :sector_id, :integer
    remove_column :applications, :district, :string
    remove_column :applications, :sector, :string
    remove_column :employers, :district, :string
    remove_column :employers, :sector, :string
  end
end
