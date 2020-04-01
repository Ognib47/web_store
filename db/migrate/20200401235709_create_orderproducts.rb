class CreateOrderproducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orderproducts do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :qty
      t.integer :purchase_price_cents

      t.timestamps
    end
  end
end
