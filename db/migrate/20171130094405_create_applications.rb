class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :id_number
      t.string :district
      t.string :sector
      t.string :phone_number
      t.integer :bank_id
      t.string :bank_number
      t.boolean :is_female, :default => nil
      t.boolean :internship_placement, :default => false
      t.integer :field_of_study_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
