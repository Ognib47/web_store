class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
