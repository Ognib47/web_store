class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :cost_cents
      t.string :product_status

      t.timestamps
    end
  end
end
