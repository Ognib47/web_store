# frozen_string_literal: true

class ColumnsToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :user_id, false
  end
end
