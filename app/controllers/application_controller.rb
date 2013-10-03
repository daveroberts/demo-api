class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :logged_in?
  before_filter :simulate_lag
  def simulate_lag
    sleep(3.seconds)
  end

  def logged_in?
    return session[:user_id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end
end
