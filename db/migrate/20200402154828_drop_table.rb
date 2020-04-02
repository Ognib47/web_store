# frozen_string_literal: true

class DropTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :customer_id, :refreneces
    drop_table(:customers)
  end
end
