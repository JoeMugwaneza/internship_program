class RenameUserIdToInternshipUpdates < ActiveRecord::Migration[5.1]
  def change
    rename_column :internship_updates, :user_id, :application_id
  end
end
