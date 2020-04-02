# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :category_id, :name, :description, :cost_cents, :product_status, :image

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
