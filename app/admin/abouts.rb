# frozen_string_literal: true

ActiveAdmin.register About do
  permit_params :title, :content, :creator_name
end
