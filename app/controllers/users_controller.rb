class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

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

  def index
    @users = User.where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :budget, :timeframe, :current_role, :current_industry, :future_role, :future_industry, :available_hrs_per_week, :status)
  end

end
