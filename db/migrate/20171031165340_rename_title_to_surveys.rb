class RenameTitleToSurveys < ActiveRecord::Migration[5.1]
  def change
    rename_column :surveys, :title, :name
  end
end
