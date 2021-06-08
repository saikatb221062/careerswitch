class UsersController < ApplicationController
  def editprofile
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to dashboard_page_path
  end

  def updateprofile
    @user = current_user
    @user.update(user_params)
    redirect_to dashboard_page_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :budget, :timeframe, :current_role, :current_industry, :future_role, :future_industry, :available_hrs_per_week, :status)
  end
end
