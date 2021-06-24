class ConnectionsController < ApplicationController
  def connect
    @user = User.find(params[:id])
    @button = params[:button]
    if current_user.connect(@user.id)
      respond_to do |format|
        format.js
      end
    end
  end

  def disconnect
    @user = User.find(params[:id])
    @button = params[:button]
    if current_user.disconnect
      respond_to do |format|
        format.js
      end
    end
  end
end
