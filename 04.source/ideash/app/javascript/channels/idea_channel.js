import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("IdeaChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    // console.log('test')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    return alert(data['idea_log']);
  },

  speak: function(idea_log) {
    return this.perform('speak', {
      idea_log: idea_log
        });
  }
});

$(document).on('keypress', '[data-behavior~=idea_speaker]', function(event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});
