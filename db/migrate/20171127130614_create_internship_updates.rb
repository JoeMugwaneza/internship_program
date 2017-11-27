class CreateInternshipUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :internship_updates do |t|
      t.datetime :starting_at
      t.integer :chain_value_id
      t.boolean :completed, :default => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
