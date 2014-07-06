class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :load_dashboard

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
      { locale: I18n.locale }
  end

  private

  def load_dashboard
      @proyects = Proyect.all
    if user_signed_in?
      @experiences = Experience.all
    end
  end

end

