# frozen_string_literal: true

ActiveAdmin.register Contact do
  permit_params :title, :name, :email, :phone_number, :address
end
