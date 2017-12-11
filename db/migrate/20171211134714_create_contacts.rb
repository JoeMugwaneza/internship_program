class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :phone_number
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
