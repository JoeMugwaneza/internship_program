class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :result_name
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
