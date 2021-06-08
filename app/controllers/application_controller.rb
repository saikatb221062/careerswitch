class ApplicationController < ActionController::Base
  before_action :persist_last_visited_path
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end
  end

  private

  def persist_last_visited_path
    return if Rails.configuration.ignored_paths.include?(request.path)

    session[:last_visited_path] = request.url
  end
end
