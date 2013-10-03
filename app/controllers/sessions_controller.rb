class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = "Invalid username or password"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    flash.notice = "You have been logged out"
    redirect_to login_path
  end
end
