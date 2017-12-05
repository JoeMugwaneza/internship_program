class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :internship_updates,  column: :application_id

  end
end
