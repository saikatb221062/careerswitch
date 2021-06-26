class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :persist_last_visited_path
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[current_role current_industry future_role first_name last_name budget timeframe location])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[current_role current_industry future_role])
  end

  private

  def persist_last_visited_path
    return if Rails.configuration.ignored_paths.include?(request.path)

    session[:last_visited_path] = request.url
  end
end
