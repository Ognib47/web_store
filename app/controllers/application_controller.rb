# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[province_id address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[province_id address])
  end
end
