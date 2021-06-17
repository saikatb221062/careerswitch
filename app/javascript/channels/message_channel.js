import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chat_id = document.getElementById("chat_id").value;
  
  consumer.subscriptions.create({channel: "MessageChannel", chat_id: chat_id}, {
    connected() {
      console.log("Channel Connected!!!" + chat_id);
    },

    disconnected() {
      console.log("Disconnected")
    },

    received(data) {
      document.getElementById("messages").innerHTML += data.html
    }
  });
});