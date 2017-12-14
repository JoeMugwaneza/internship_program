class AddDistrictIdToSectors < ActiveRecord::Migration[5.1]
  def change
    add_column :sectors, :district_id, :integer
  end
end
