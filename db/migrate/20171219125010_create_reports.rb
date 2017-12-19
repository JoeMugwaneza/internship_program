class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.date :due_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
