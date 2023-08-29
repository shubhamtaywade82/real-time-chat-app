import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatRoomChannel", room_id: "your_room_id" }, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to chat room channel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from chat room channel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#messages').append(data.message);
  },

  send_message(message) {
    this.perform('receive', { content: message });
  }
});

$(document).on('turbolinks:load', function() {
  $('#message_form').on('submit', function(e) {
    e.preventDefault();
    const message = $('#message_input').val();
    consumer.subscriptions.subscriptions[0].send_message(message);
    $('#message_input').val('');
  });
});