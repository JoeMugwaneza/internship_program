class CreateFieldOfStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :field_of_studies do |t|
      t.string :name

      t.timestamps
    end
  end
end
