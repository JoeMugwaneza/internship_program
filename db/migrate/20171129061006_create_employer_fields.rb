class CreateEmployerFields < ActiveRecord::Migration[5.1]
  def change
    create_table :employer_fields do |t|
      t.references :employer, foreign_key: true
      t.references :field_of_study, foreign_key: true

      t.timestamps
    end
  end
end
