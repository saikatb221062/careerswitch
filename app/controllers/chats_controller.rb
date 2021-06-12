class ChatsController < ApplicationController
  def chat
    @user = current_user
    @connection = Connection.find(params[:id])
    if @connection.connected_id == @user.id
      @friend = User.find(@connection.connecting_id)
    else
      @friend = User.find(@connection.connected_id)
    end

    @chat_messages = Message.where("connection_id = ?", params[:id])
  end

  def sending
    @user = current_user
    @connection = Connection.find(params[:id])
    if @connection.connected_id == @user.id
      @friend = User.find(@connection.connecting_id)
    else
      @friend = User.find(@connection.connected_id)
    end
    
    @messages = params[:messages]

    Message.create!(
      content: @messages,
      connection_id: @connection.id,
      user_id: @user.id,
    )

    @chat_messages = Message.where("connection_id = ?", params[:id])

    redirect_to chat_path
  end
end
