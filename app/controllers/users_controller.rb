class UsersController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      flash[:notice] = "Login is invalid!"
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
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
