import { scrollDown } from "../packs/scroll";
import consumer from "./consumer"

const startChatRoom = () => {
  
  const messagesContainer = document.getElementById("messages");
  
  if (messagesContainer) {
    const id = document.getElementById("chat_id").value;
    consumer.subscriptions.create({channel: "MessageChannel", id: id}, {
      connected() {
        console.log("Channel Connected!!!" + id);
      },

      disconnected() {
        console.log("Disconnected")
      },

      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        scrollDown()
      }
    });
  }
}


export { startChatRoom }