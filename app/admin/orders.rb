# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :gst_rate, :pst_rate, :total_cost, :users_id
end
