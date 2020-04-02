# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :provinces, foreign_key: true
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
