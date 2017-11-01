class RemoveForeignKeyToSurvey < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :survey_id, :integer
  end
end
