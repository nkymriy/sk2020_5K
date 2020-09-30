import consumer from "../../channels/consumer"

$(document).on("turbolinks:load", function () {
    if ($('.websocket').length > 0) {
        consumer.task = consumer.subscriptions.create({
            channel: 'IdeaChannel',
            idea: $('#idea_logs').data('idea_id')
        }, {
            connected() {
                // Called when the subscription is ready for use on the server
                return this.perform('join_user');
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(idea_log) {
                console.log(idea_log)
                let query = idea_log['idea_logs']
                if (query['mode'] == 'join') {
                    var user_id = 'participant_' + query['user_id']
                    if ($('#' + user_id).length === 0) {
                        $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                    }
                } else if (query['mode'] == 'add') {
                    let add = query["add"]
                    var escapeHTML = function (val) {
                        return $('<div />').text(val).html();
                    };
                    const idea_text = escapeHTML(add["content"]);

                    if (idea_text == null || idea_text == "") {
                        return false;
                    }

                    var id = parseInt(localStorage.getItem('card_id')) + 1;
                    var div = $(
                        '<div class="teal card idea none" id="' + id + '">\n' +
                        '      <div class="content">\n' +
                        idea_text +
                        '      </div>\n' +
                        '    </div>'
                    );
                    $("#ideas").prepend(div);
                    $('#' + id).show('slide', '', 500);
                    localStorage.setItem('card_id', id);
                } else if (query['mode'] == 'chat') {
                    var user_id = 'chatuser_' + query['user_id']
                    var chat_text

                    if ($('#user_id').val() == query['user_id']) {
                        chat_text = `<div class="ui right pointing label chat-message">${query['chat']['content']}</div>`
                    } else {
                        chat_text = `<div class="ui left pointing label chat-message">${query['chat']['content']}</div>`
                    }

                    if (user_id == $('.chat_content').first().attr('name')) {
                        $('.chat-username').first()[0].remove()
                    }

                    $('.chat_contents').prepend(`
                        <div class="chat_content" name="chatuser_${query['user_id']}">
                            <h6 class="chat-username">${query['chat']['user_name']}</h6>
                            ${chat_text}
                        </div>
                    `)
                }
            },
            add: function (idea_log) {
                return this.perform('add',
                    idea_log
                );
            },
            chat: function (idea_log) {
                return this.perform('chat_send',
                    idea_log
                );
            }
        });

        $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {
            if (event.keyCode === 13) {
                if (event.target.value === "") return false
                console.log(event.target.id)
                let content = {
                    content: event.target.value
                };
                if (event.target.id == 'idea_add') {
                    consumer.task.add(content);
                } else if (event.target.id == 'idea_chat') {
                    consumer.task.chat(content);
                }
                event.target.value = '';
                return event.preventDefault();
            }
        });
    } else {
        if (consumer.task) {
            consumer.task.unsubscribe()
        }
    }
});
