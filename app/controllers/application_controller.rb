class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    return session[:user_id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end
end
