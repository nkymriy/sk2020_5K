import consumer from "../../channels/consumer"

require('jquery-ui-dist/jquery-ui')

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
                let query = json_idea_log['idea_logs']
                if (query['mode'] === 'join') {
                    var user_id = 'participant_' + query['user_id']
                    if ($('#' + user_id).length === 0) {
                        $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                    }
                } else if (query['mode'] === 'add') {
                    let add = query["add"]
                    const idea_text = escapeHTML(add["content"]);

                    if (idea_text === null || idea_text === "") {
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
                    var object_id = "object_id_" + query['add']['object_id']
                    var p3_div = $(
                        `<div class="idea" id=${object_id} draggable="true" ondragstart="dragstart_handler(event)">\n` +
                        '       <div class="ui teal large label">\n' +
                        idea_text +
                        '       </div>\n' +
                        '</div>'
                    );
                    $("#p3_ideas").prepend(p3_div);

                } else if (query['mode'] === 'chat') {
                    var user_id = 'chatuser_' + query['user_id']
                    var user_name = escapeHTML(query['chat']['user_name'])
                    var chat_text = escapeHTML(query['chat']['content']);
                    var chat_div;
                    if ($('#user_id').val() === query['user_id']) {
                        chat_div = `<div class="ui right pointing label chat_message">${chat_text}</div>`
                    } else {
                        chat_div = `<div class="ui left pointing label chat_message">${chat_text}</div>`
                    }
                    if (user_id !== $('.chat_content').first().attr('name')) {
                        $('.chat_contents').first().prepend(`
                        <div class="chat_content" name="chatuser_${query['user_id']}">
                            <h6 class="chat_username">${user_name}</h6>
                        </div>
                    `)
                    }
                    $('.chat_username').first().after(chat_div)

                } else if (query['mode'] === 'system') {
                    if (query['system']['operation'] === 'stop') {
                        if (query['system']['option'] === 'process1') {
                            alert('プロセス2に移行します!!\n' +
                                'メンバー内でアイデアを共有し、\n' +
                                '質問やアイデアの結合を行いましょう!!')
                            $('#idea_add').prop('disabled', true)
                        } else if (query['system']['option'] === 'process2') {
                            alert('プロセス3に移行します!!')
                            $('#process_1').hide()
                            $('#process_3').show()
                            $('#idea_add').prop('disabled', false)
                        } else if (query['system']['option'] === 'process3') {
                            alert('終了!!\n' +
                                'お疲れさまでした!!')
                        }
                    } else if (query['system']['operation'] === 'group_rename') {
                        var id = '#brain_rename_' + query['system']['option']['group_id'].toString()
                        var name = query['system']['option']['name']
                        $(id).attr('placeholder', name)
                    } else if (query['system']['operation'] === 'grouping') {
                        var object_id = 'object_id_' + query['system']['option']['object_id']
                        var group_id = 'group_id_' + query['system']['option']['group_id']
                        var div = $(
                            `<div class="idea" id=${object_id} draggable="true" ondragstart="dragstart_handler(event)">\n` +
                            '       <div class="ui teal large label">\n' +
                            query['system']['option']['content'] +
                            '       </div>\n' +
                            '</div>'
                        );
                        $('#' + object_id).remove();
                        $('#' + group_id).append(div);
                    }
                } else if (query['mode'] === 'group') {
                    console.log(query)
                    var group_id = escapeHTML(query['group']['group_id'])
                    var group_name = escapeHTML(query['group']['name'])
                    $('.group-contents').append(`
                        <div class="group" ondrop="drop_handler(event)" ondragover="dragover_handler(event)">
                          <div class="ui stacked segments group" id="group_id_${group_id}">
                            <div class="ui huge transparent input">
                              <input type="text" name="brain_rename_${group_id}" id="brain_rename_${group_id}" placeholder="${group_name}" data-behavior="idea_speaker"}>
                            </div>
                          </div>
                        </div>
                    `)
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
            },
            group_add: function () {
                return this.perform('group_add');
            },
            group_rename: function (json_idea_log) {
                return this.perform('group_rename',
                    json_idea_log
                );
            },
            grouping: function (json_idea_log) {
                return this.perform('grouping',
                    json_idea_log
                );
            },
        });

        $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {
            if (event.keyCode === 13) {
                if (event.target.value === "") return false
                var content = {
                    content: event.target.value
                };
                if (event.target.id === 'idea_add') {
                    consumer.task.add(content);
                } else if (event.target.id === 'idea_chat') {
                    consumer.task.chat(content);
                } else if (event.target.id.startsWith('brain_rename_')) {
                    content = {
                        content: {
                            group_id: event.target.id.replace(/[^0-9]/g, ''),
                            name: event.target.value
                        }
                    }
                    consumer.task.group_rename(content);
                }
                event.target.value = '';
                return event.preventDefault();
            }
        });

        $('#group_add').on('click', function () {
            consumer.task.group_add();
        });

        $('.group-contents').on("drop", function (event) {
            console.log(event.target.lastChild.innerText)
            console.log(event.target.lastChild)
            console.log(event.target.lastChild.id)
            console.log(event.target.id.indexOf('group_id'))
            console.log(location.href)
            if (event.target.id.indexOf('group_id') === 0) {
                event.preventDefault();
                var content = {
                    content: {
                        object_id: event.target.lastChild.id.replace(/[^0-9]/g, ''),
                        content: event.target.lastChild.innerText,
                        group_id: event.target.id.replace(/[^0-9]/g, '')
                    }
                }
                consumer.task.grouping(content);
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