class ApplicationController < ActionController::Base
  before_action :set_locale
  private

  def set_locale
    I18n.locale = return_i18n_locale
  end

  def return_i18n_locale
    locale = params[:locale].to_s.strip.to_sym
    return locale if I18n.available_locales.include?(locale)

    I18n.default_locale
  end
end
