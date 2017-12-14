class AddProvinceIdToDistricts < ActiveRecord::Migration[5.1]
  def change
    add_column :districts, :province_id, :integer
  end
end
