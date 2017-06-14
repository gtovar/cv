class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    after_action :verify_authorized, except: [:send_email,:home,:show],unless: :devise_controller?

    protect_from_forgery with: :exception, :except => [:send_email,:home]

    before_action :set_locale, :load_dashboard

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
        { locale: I18n.locale }
    end

    private

    def load_dashboard
        @proyects = Proyect.includes(:experience,:translations)
        @experiences = Experience.includes(:proyects,:translations).order(start_date: :desc)
    end

    def user_not_authorized(exception)
        policy_name = exception.policy.class.to_s.underscore
        flash[:notice] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
        redirect_to (request.referrer || root_path)
    end

end

