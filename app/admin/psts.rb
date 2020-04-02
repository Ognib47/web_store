# frozen_string_literal: true

ActiveAdmin.register Pst do
  permit_params :province, :pst_rate
end
