class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :authenticate_user!


  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  def default_url_options
    if I18n.locale != I18n.default_locale
      { lang: I18n.locale }
    else
      {}
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def set_locale
    if params[:lang].present? && I18n.locale_available?(params[:lang])
      I18n.locale = params[:lang]
    else
      I18n.locale = I18n.default_locale
    end
  end
end
