# frozen_string_literal: true

class AddReferenceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :users, foreign_key: true
  end
end
