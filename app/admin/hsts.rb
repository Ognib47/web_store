# frozen_string_literal: true

ActiveAdmin.register Hst do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :province, :hst_rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:province, :hst_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
