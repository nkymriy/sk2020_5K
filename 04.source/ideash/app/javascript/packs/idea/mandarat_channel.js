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
                    $('.t1').css('background-color', '#C0C0C0');
                    console.log("focusin");
                } else if (query['mode'] === 'edit') {
                    console.log("focusout");
                    $('.t1').css('background-color', '#FFFFFF');
                    document.getElementById( "zoom_1" ).value = query["edit"]["content"] ;
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
            editing: function (object_id) {
                return this.perform('editing',
                    object_id);
            },
            edit: function (object_id) {
                return this.perform('edit',
                    object_id);
            }
        });

        $(function() {
            for(let i=0; i<=80; i++) {
                $('#zoom_'+i)
                    //テキストボックスにフォーカス時
                    .focusin(function(e) {
                        //console.log("text"+i)
                        consumer.task.editing();
                    })
                    //テキストボックスからフォーカス外したとき
                    .focusout(function(e) {
                        let content = { content: event.target.value };
                        consumer.task.edit(content);
                    });
            }

        });
        // $('#text1').on('focus', '[data-behavior~=idea_speaker]', function (event) {
        //     //console.log($(this).css("background-color"));
        //     //document.getElementById("text1").focus();
        //     console.log("----------")
        // });
        // $(document).on('focus', '[data-behavior~=idea_speaker]', function (event) {
        //     console.log($(this).css("background-color"));
        //     let content = {
        //         content: event.target.value
        //     };
        //     consumer.task.editing(content);
        // });


        $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {

            if (event.keyCode === 13) {

                // console.log("--------------------")
                // console.log($(this).css("background-color"));

                if (event.target.value === "") return false
                let content = {
                    content: event.target.value
                };
                //consumer.task.add(add);
                event.target.value = '';
                consumer.task.editing(content);
                return event.preventDefault();
            }
        });
    } else {
        if (consumer.task) {
            consumer.task.unsubscribe()
        }
    }
});