class ConnectionsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    @button = params[:button]
    if current_user.connect(@user.id)
      respond_to do |format|
        format.js
      end
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @button = params[:button]
    if current_user.unfollow(@user)
      respond_to do |format|
        format.js { render action: :follow }
      end
    end
  end
end
