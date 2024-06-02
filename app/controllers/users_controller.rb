class UsersController < ApplicationController
  before_action :authenticate_user!

  def update_profile
    if current_user.update(user_params)
      flash[:notice] = "Profile updated successfully"
      redirect_to dashboard_path
    end
  end

  private
   
  def user_params
    params.require(:user).permit(:username, :name, :avatar)
  end
end
