class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    return I18n.locale = locale if I18n.available_locales.include?(locale)

    I18n.locale = I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
  def hello
    render html: "Hello, world"
  end

end
