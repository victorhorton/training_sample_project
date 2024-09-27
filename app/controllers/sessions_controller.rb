class SessionsController < ApplicationController
  def new; end
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      notice = "Login Successful!"
    else
      notice = "Login is invalid!"
    end
    redirect_to root_path, notice: notice
  end

  def destroy
    if session.clear
      notice = "Logout Successful!"
    else
      notice = "Logout is invalid!"
    end
    redirect_to root_path, notice: notice
  end
end
