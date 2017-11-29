class CreateChainValues < ActiveRecord::Migration[5.1]
  def change
    create_table :chain_values do |t|
      t.string :name

      t.timestamps
    end
  end
end
