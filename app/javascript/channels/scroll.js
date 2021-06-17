const messages = document.getElementById('messages');

function appendMessage() {
	const message = document.getElementsByClassName('message-body')[0];
  const newMessage = message.cloneNode(true);
  messages.appendChild(newMessage);
  console.log("append")
}

function getMessages() {
	// Prior to getting your messages.
  shouldScroll = messages.scrollTop + messages.clientHeight === messages.scrollHeight;
  /*
   * Get your messages, we'll just simulate it by appending a new one syncronously.
   */
  appendMessage();
  // After getting your messages.
  if (!shouldScroll) {
    scrollToBottom();
    console.log("should scroll")
  }
}

function scrollToBottom() {
  messages.scrollTop = messages.scrollHeight;
  console.log("scrolling to bottom")
}

scrollToBottom();

export { scrollToBottom }