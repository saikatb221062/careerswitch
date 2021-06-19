class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "message_channel_#{params[:chat_id]}" 

    connection = Connection.find("#{params[:id]}")
    stream_for connection 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
