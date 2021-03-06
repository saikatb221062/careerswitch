class ChatsController < ApplicationController
  def chat
    if current_user.nil?
      @connections = Connection.none
    else
      @connections = Connection.where(connecting_id: current_user.id) + Connection.where(connecter_id: current_user.id)
    end

    @user = current_user
    @connection = Connection.find(params[:id])

    if @connection.connecter_id == @user.id
      @friend = User.find(@connection.connecting_id)
    else
      @friend = User.find(@connection.connecter_id)
    end

    if @connection.connecter_id == @user.id || @connection.connecting_id == @user.id
      @chat_messages = Message.where("connection_id = ?", params[:id])
    else
      redirect_to networks_page_path
    end
  end
end
