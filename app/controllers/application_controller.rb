class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ApplicationHelper
  # before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  respond_to :json, :html

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
  end

  def user_not_authorized
    flash[:alert] = t("flash.pundit.unauthorized")
    redirect_back(fallback_location: root_path)
  end

  # def set_locale
  #   locale = country_to_language(request.location.country.to_s.downcase)
  #   # puts "===========the locale is #{locale}==========="
  #   # puts "===========the locale is #{I18n.available_locales.include?(locale.to_sym)}==========="
  #   # locale = :fr
  #   I18n.locale = I18n.available_locales.include?(locale.to_sym) ?
  #       locale :
  #       I18n.default_locale
  # end
end
