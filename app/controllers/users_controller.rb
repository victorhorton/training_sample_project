class UsersController < ApplicationController
  load_and_authorize_resource
  def create
    @user = User.new(user_params)
    if @user.save
      notice = "Signup Successful!"
    else
      notice = @user.errors.full_messages.join(", ")
    end
    redirect_to root_path, notice: notice
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    permitted = [ :username, :password, :password_confirmation ]
    permitted << :role if can?(:edit_role, User)
    params.require(:user).permit(permitted)
  end
end
