class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(messages)
    html = "<p> #{messages.user.first_name}: #{messages.content}</p>"
    chat_id = messages.connection_id
    ActionCable.server.broadcast("message_channel_#{chat_id}", html: html)
  end
end
