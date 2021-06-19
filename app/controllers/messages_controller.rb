class MessagesController < ApplicationController
  def create    
    @user = current_user
    @connection = Connection.find(params[:id])
    
    @messages = params[:messages]

    messages = Message.create!(
      content: @messages,
      connection_id: @connection.id,
      user_id: @user.id,
    )

    MessageChannel.broadcast_to(
      @connection,
      render_to_string(partial: "message", locals: { message: messages })
    )
    
    redirect_to chat_path(@connection.id, anchor: "message-#{messages.id}")
  end 
end
