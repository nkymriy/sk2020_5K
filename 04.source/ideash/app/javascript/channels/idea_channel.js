import consumer from "./consumer"

$(function () {
    const chatChannel = consumer.subscriptions.create({channel: 'IdeaChannel', idea: $('#idea_logs').data('idea_id')}, {
        connected() {
            // Called when the subscription is ready for use on the server
            // console.log('test')
        },

        disconnected() {
            // Called when the subscription has been terminated by the server
        },

        received(data) {
            // Called when there's incoming data on the websocket for this channel
            // return alert(JSON.stringify(data));
            return $('#idea_logs').append(data['idea_logs']);
        },

        speak: function (idea_log) {
            return this.perform('speak', {
                idea_log: idea_log
            });
        }
    });

    $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {
        if (event.keyCode === 13) {
            chatChannel.speak(event.target.value);
            event.target.value = '';
            return event.preventDefault();
        }
    });
});