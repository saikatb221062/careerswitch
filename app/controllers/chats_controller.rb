class ChatsController < ApplicationController
  def chat
    if current_user.nil?
      @connections = Connection.none
    else
      @connections = Connection.where(connecting_id: current_user.id) + Connection.where(connected_id: current_user.id)
    end

    @user = current_user
    @connection = Connection.find(params[:id])
    if @connection.connected_id == @user.id
      @friend = User.find(@connection.connecting_id)
    else
      @friend = User.find(@connection.connected_id)
    end

    @chat_messages = Message.where("connection_id = ?", params[:id])
  end
end
