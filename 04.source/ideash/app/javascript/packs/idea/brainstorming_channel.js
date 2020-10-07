import consumer from "../../channels/consumer"

$(document).on("turbolinks:load", function () {
    if ($('.websocket').length > 0) {
        consumer.task = consumer.subscriptions.create({
            channel: 'IdeaChannel',
            idea: $('#idea_logs').data('idea_id')
        }, {
            connected() {
                // Called when the subscription is ready for use on the server
                this.perform('join_user');
                return this.perform('pause');
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(json_idea_log) {
                console.log(json_idea_log)
                let query = json_idea_log['idea_logs']
                console.log(query)
                console.log(query['mode'])
                if (query['mode'] == 'join') {
                    var user_id = 'participant_' + query['user_id']
                    if ($('#' + user_id).length === 0) {
                        $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                    }
                } else if (query['mode'] == 'add') {
                    let add = query["add"]

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
                    var user_name = escapeHTML(query['chat']['user_name'])
                    var chat_text = escapeHTML(query['chat']['content']);
                    var chat_div;
                    if ($('#user_id').val() == query['user_id']) {
                        chat_div = `<div class="ui right pointing label chat_message">${chat_text}</div>`
                    } else {
                        chat_div = `<div class="ui left pointing label chat_message">${chat_text}</div>`
                    }
                    if (user_id != $('.chat_content').first().attr('name')) {
                        $('.chat_contents').first().prepend(`
                        <div class="chat_content" name="chatuser_${query['user_id']}">
                            <h6 class="chat_username">${user_name}</h6>
                        </div>
                    `)
                    }
                    $('.chat_username').first().after(chat_div)

                } else if (query['mode'] == 'system'){
                    console.log(query['mode'])
                    if(query['system']['operation'] == 'stop'){
                        console.log(query['system']['operation'])
                        if(query['system']['option'] == 'process1') {
                            console.log(query['system']['option'])
                            alert('プロセス2に移行します!!')
                            $('#process_1')[0].style.display = "none";
                            $('#process_2')[0].style.display = "block";
                        }else if(query['system']['option'] == 'process2'){
                            alert('プロセス3に移行します!!')
                            $('#process_2')[0].style.display = "none";
                            $('#process_3')[0].style.display = "block";
                        }else if(query['system']['option'] == 'process3'){
                            alert('終了!!お疲れさまでした!!')
                        }
                    }
                }
            },
            add: function (json_idea_log) {
                return this.perform('add',
                    json_idea_log
                );
            },
            chat: function (json_idea_log) {
                return this.perform('chat_send',
                    json_idea_log
                );
            }
        });
        $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {
            if (event.keyCode === 13) {
                if (event.target.value === "") return false
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

// NOTE: エスケープ処理
const escapeHTML = function (val) {
    return $('<div />').text(val).html();
};
