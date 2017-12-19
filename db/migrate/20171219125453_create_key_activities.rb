class CreateKeyActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :key_activities do |t|
      t.string :activity_name
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
