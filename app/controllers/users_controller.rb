class UsersController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      notice = "Login Successful!"
    else
      notice = "Login is invalid!"
    end
    redirect_to root_path, notice: notice
  end

  def logout
    if session.clear
      notice = "Logout Successful!"
    else
      notice = "Logout is invalid!"
    end
    redirect_to root_path, notice: notice
  end

  def create
    @user = User.new(user_params)
    if @user.save
      notice = "Signup Successful!"
    else
      notice = "Signup Failed!"
    end
    redirect_to root_path, notice: notice
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :role,
      :password
    )
  end
end
