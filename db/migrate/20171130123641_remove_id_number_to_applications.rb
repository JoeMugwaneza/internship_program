class RemoveIdNumberToApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :id_number, :string
  end
end
