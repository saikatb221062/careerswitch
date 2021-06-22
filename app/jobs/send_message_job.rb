class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(messages)
    # html = "<p> #{messages.user.first_name}: #{messages.content}</p>"
    html = `
    <div class="message-container" id="message-#{messages.id}">
      <i class="author">
        <span><b>#{messages.user.first_name}</b></span>
        <small>#{messages.created_at.strftime("%b %e at %l:%M%p")}</small>
      </i>
      <p>#{messages.content}</p>
    </div>
    `
    chat_id = messages.connection_id
    ActionCable.server.broadcast("message_channel_#{chat_id}", html: html)
  end
end
