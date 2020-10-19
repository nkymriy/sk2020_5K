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
                this.perform('join_user');
            },

            disconnected() {
                // Called when the subscription has been terminated by the server
            },

            received(idea_log) {
                // if (query['mode'] == 'join') {
                //     var user_id = 'participant_' + query['user_id']
                //     if ($('#' + user_id).length === 0) {
                //         $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                //     }
                // }

                let query = idea_log['idea_logs']
                let val = parseInt(localStorage.getItem('radio_value'));

                //編集時
                if (query['mode'] === 'editing') {
                    //IdeaLog.where(is_editing: '1')
                    let first = '.t';
                    let sel_num = + parseInt(query["editing"]["object_id"]) - val;
                    let sel_class = first + sel_num;
                    //console.log (sel_class);
                    $(sel_class).css('background-color', '#C0C0C0');
                    console.log("focusin");
                }
                //確定時
                else if (query['mode'] === 'edit') {
                    let text = query["edit"]["content"];
                    let first1 = '.t'; let first2 = 'zoom_';
                    let bigid = query["edit"]["object_id"];
                    let minid = bigid - val;
                    let sel_class = first1 + minid;
                    let sel_id = first2 + minid;
                    $(sel_class).css('background-color', '#FFFFFF');
                    //console.log(sel_class);
                    document.getElementById(sel_id).value = text;
                    $('#'+bigid).text(text);
                    console.log(bigid);
                    let left = String(bigid).slice(0,1);
                    let right = String(bigid).slice(-1);
                    //console.log(sel_id);
                    console.log("focusout");

                    //メインテーマ,サブテーマを表示させるとこ
                    if(bigid == '44') { $('#main').text(text); }
                    else if(bigid == '4') { $('#theme0').text(text); }
                    else if (left ==  '4') { $('#theme'+right).text(text); }
                    else if(bigid % 10 == 4){ $('#theme'+left).text(text); }
                }
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

        //ズームイン画面の処理
        $(function() {
            for(let i=0; i<=8; i++) {
                $('#zoom_'+i)
                    //テキストボックスにフォーカス時
                    .focusin(function(event) {
                        let val = parseInt(localStorage.getItem('radio_value'));
                        let content = { object_id: val+i};
                        console.log(content);
                        consumer.task.editing(content);
                    })
                    //テキストボックスからフォーカス外したとき
                    .focusout(function(event) {
                        let val = parseInt(localStorage.getItem('radio_value'));
                        let content = { object_id: val+i, content: event.delegateTarget.value };
                        console.log(content);
                        consumer.task.edit(content);
                    });
            }
        });

        //左上のミニマップ選択された後
        $('input:radio[name="hoge"]').change(function() {
            const value = $('input:radio[name="hoge"]:checked').val();
            console.log(value);
            localStorage.setItem('radio_value', value);
        });
        $('input[value="40"]').prop('checked', true).change();

        //矢印ボタンでミニマップを移動
        $(function(){
            $('#to-up-button').on('click', upbtn);
            $('#to-left-button').on('click', leftbtn);
            $('#to-right-button').on('click', rightbtn);
            $('#to-down-button').on('click', downbtn);
            function upbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value'))-30;
                if(radioval >= 0) {
                    $('input[value='+radioval+']').prop('checked', true).change();
                }
            }
            function leftbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value'))-10;
                if(radioval % 30 !== 20) {
                    $('input[value='+radioval+']').prop('checked', true).change();
                }
            }
            function rightbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value'))+10;
                if(radioval % 30 !== 0) {
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }
            function downbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value'))+30;
                if(radioval <= 80) {
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }
        });

    } else {
        if (consumer.task) {
            consumer.task.unsubscribe()
        }
    }
});