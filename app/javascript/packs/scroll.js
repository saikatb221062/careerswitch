
const scrollDown = () => {
  const messages = document.getElementById("messages")

  if (messages) {
    const lastMessageId = messages.lastElementChild.id 
    if (lastMessageId) {
      location.hash = `#${lastMessageId}`
    };
  };
}

export { scrollDown }