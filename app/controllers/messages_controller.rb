class MessagesController < ApplicationController
  def create    
    @user = current_user
    @connection = Connection.find(params[:id])
    
    @message = params[:message]

    message = Message.create!(
      content: @message,
      connection_id: @connection.id,
      user_id: @user.id,
    )

    MessageChannel.broadcast_to(
      @connection,
      render_to_string(partial: "message", locals: { message: message })
    )
    
    redirect_to chat_path(message.connection_id, anchor: "message-#{message.id}")
  end 
end
