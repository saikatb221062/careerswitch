class ChatsController < ApplicationController
  def chat
    @user = current_user
    @connection = Connection.find(params[:id])
    @friend = User.find(@connection.connected_id)
  end
end
