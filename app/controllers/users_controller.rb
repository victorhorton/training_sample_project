class UsersController < ApplicationController
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
