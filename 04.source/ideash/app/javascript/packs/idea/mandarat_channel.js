import consumer from "../../channels/consumer"

$(document).on("turbolinks:load", function () {
    if ($('.websocket-mandarat').length > 0) {
        // const chatChannel = consumer.subscriptions.create({
        consumer.task = consumer.subscriptions.create({
            channel: 'IdeaChannel',
            idea: $('#idea_logs').data('idea_id')
        }, {
            connected() {
                // Called when the subscription is ready for use on the server
                // console.log('test')
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(idea_log) {

                let query = idea_log['idea_logs']
                if (query['mode'] == 'join') {
                    let user_id = 'participant_' + query['user_id']
                    if ($('#' + user_id).length === 0) {
                        $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                    }
                } else if (query['mode'] == 'add') {
                    // let query = idea_log['idea_logs']
                    let add = query["add"]
                    let escapeHTML = function (val) {
                        return $('<div />').text(val).html();
                    };
                    const idea_text = escapeHTML(add["content"]);

                    if (idea_text == null || idea_text === "") {
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

                } else if (query['mode'] === 'editing') {
                    //IdeaLog.where(is_editing: '1')
                    let first = '.t'; let sel_num = query["editing"]["object_id"];
                    let sel_class = first + sel_num;
                    //console.log (sel_class);
                    $(sel_class).css('background-color', '#C0C0C0');
                    console.log("focusin");
                } else if (query['mode'] === 'edit') {
                    let first1 = '.t'; let first2 = 'zoom_'; let sel_num = query["edit"]["object_id"];
                    let sel_class = first1 + sel_num;
                    let sel_id = first2 + sel_num;
                    $(sel_class).css('background-color', '#FFFFFF');
                    //console.log(sel_class);
                    document.getElementById(sel_id).value = query["edit"]["content"];
                    //console.log(sel_id);
                    console.log("focusout");
                }

                // let query = idea_log['idea_logs']
                // let add = query["add"]
                //
                // var escapeHTML = function (val) {
                //     return $('<div />').text(val).html();
                // };
                //
                // const idea_text = escapeHTML(add["content"]);
                //
                // if (idea_text == null || idea_text == "") {
                //     return false;
                // }
                //
                // var id = parseInt(localStorage.getItem('card_id')) + 1;
                // var div = $(
                //     '<div class="teal card idea none" id="' + id + '">\n' +
                //     '      <div class="content">\n' +
                //     idea_text +
                //     '      </div>\n' +
                //     '    </div>'
                // );
                // $("#ideas").prepend(div);
                // $('#' + id).show('slide', '', 500);
                // localStorage.setItem('card_id', id);
                // return $('#idea_logs').append(data['idea_logs']);
            },
            add: function (idea_log) {
                return this.perform('add',
                    idea_log
                );
            },
            editing: function (content) {
                return this.perform('editing',
                    content);
            },
            edit: function (content) {
                return this.perform('edit',
                    content);
            }
        });

        $(function() {
            for(let i=0; i<=80; i++) {
                $('#zoom_'+i)
                    //テキストボックスにフォーカス時
                    .focusin(function(event) {
                        let content = { object_id: i };
                        //console.log(content)
                        consumer.task.editing(content);
                    })
                    //テキストボックスからフォーカス外したとき
                    .focusout(function(event) {
                        let content = { object_id: i, content: event.target.text };
                        //console.log(content);
                        consumer.task.edit(content);
                    });
            }

        });

    } else {
        if (consumer.task) {
            consumer.task.unsubscribe()
        }
    }
});