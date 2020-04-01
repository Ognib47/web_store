class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :province
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
