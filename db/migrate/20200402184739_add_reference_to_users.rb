# frozen_string_literal: true

class AddReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :provinces_id, false
  end
end
