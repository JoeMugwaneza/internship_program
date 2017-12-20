class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.text :solution_name
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
