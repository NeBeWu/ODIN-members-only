class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[title username email password password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[title username email password password_confirmation
               current_password]
    )
  end

  private

  def after_sign_in_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
