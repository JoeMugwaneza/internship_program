class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.text :challenge_name
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
