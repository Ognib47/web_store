class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :gst_rate
      t.decimal :pst_rate
      t.float :total_cost

      t.timestamps
    end
  end
end
