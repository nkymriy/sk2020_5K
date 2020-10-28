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

                let query = idea_log['idea_logs']
                let val = parseInt(localStorage.getItem('radio_value'));

                //作成時
                if (query['mode'] === 'join') {
                    let user_id = 'participant_' + query['user_id']
                    if ($('#' + user_id).length === 0) {
                        $('.users').append(`<li id="participant_${query['user_id']}"><i class="user circle icon">${query['join']['user_mail']}</i></li>`)
                    }
                }
                //編集時
                if (query['mode'] === 'editing') {
                    //IdeaLog.where(is_editing: '1')
                    let first = '.t';
                    let sel_num = +parseInt(query["editing"]["object_id"]) - val;
                    let sel_class = first + sel_num;
                    $(sel_class).css('background-color', '#C0C0C0');
                }
                //確定時
                else if (query['mode'] === 'edit') {
                    let text = query["edit"]["content"];
                    let first1 = '.t';
                    let first2 = 'zoom_';
                    let bigid = query["edit"]["object_id"];
                    let minid = bigid - val;
                    let sel_class = first1 + minid;
                    let sel_id = first2 + minid;
                    $(sel_class).css('background-color', '#FFFFFF');
                    $('#' + bigid).text(text);
                    array[bigid] = text;
                    if (minid >= 0 && minid <= 8) {
                        document.getElementById(sel_id).value = text;

                    }
                    let left = String(bigid).slice(0, 1);
                    let right = String(bigid).slice(-1);
                    //メインテーマ,サブテーマを表示させるとこ
                    if (bigid === '44') {
                        $('#main').text(text);
                    } else if (bigid === '4') {
                        $('#theme0').text(text);
                    } else if (left === '4') {
                        $('#theme' + right).text(text);
                    } else if (bigid % 10 === 4) {
                        $('#theme' + left).text(text);
                    }
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
                    if (user_id != $('.chat_content').first().attr('name')) {
                        $('.chat_contents').first().prepend(`
                        <div class="chat_content" name="chatuser_${query['user_id']}">
                            <h6 class="chat_username">${user_name}</h6>
                        </div>
                    `)
                    }
                    $('.chat_username').first().after(chat_div)
                }
            },

            editing: function (content) {
                return this.perform('editing',
                    content);
            },
            edit: function (content) {
                return this.perform('edit',
                    content);
            },
            chat: function (idea_log) {
                return this.perform('chat_send',
                    idea_log
                );
            }
        });

        //初回読み込み時の処理
        localStorage.setItem('flg', '1');
        let array = {};
        for (let i = 0; i <= 8; i++) {
            for (let j = 0; j <= 8; j++) {
                let x = i * 10 + j;
                let text = $('input:hidden[name="read_' + x + '"]').val();
                array[x] = text;
                $('#' + x).text(text);
                if (x === 44) {
                    $('#main').text(text);
                } else if (i === 4) {
                    $('#theme' + j).text(text);
                }
            }
        }

        //ズームイン画面の処理
        $(function () {
            for (let i = 0; i <= 8; i++) {
                let flg = false;
                $('#zoom_' + i)
                    //テキストボックスにフォーカス時
                    .focusin(function (event) {
                        //入力中にミニマップと矢印で移動できないように
                        $('#radio-btn').addClass('btn-invalid');
                        $('#to-up-button').addClass('btn-invalid');
                        $('#to-left-button').addClass('btn-invalid');
                        $('#to-right-button').addClass('btn-invalid');
                        $('#to-down-button').addClass('btn-invalid');
                        let val = parseInt(localStorage.getItem('radio_value'));
                        let objid = val + i;
                        let content = {object_id: objid};
                        consumer.task.editing(content);
                        //上か下一桁が4
                        if (((Math.floor(objid / 10) === 4) || (objid % 10 === 4)) && objid !== 44) {
                            //値の1桁目と2桁目を入れ替える
                            let pairObjid = Math.floor(objid / 10) + objid % 10 * 10;
                            content = {object_id: pairObjid};
                            consumer.task.editing(content)
                            flg = !flg;
                        }
                    })
                    //テキストボックスからフォーカス外したとき
                    .focusout(function (event) {
                        let val = parseInt(localStorage.getItem('radio_value'));
                        let text = event.delegateTarget.value;
                        let objid = val + i;
                        let content = {object_id: objid, content: text};
                        consumer.task.edit(content);
                        if (flg) {
                            let pairObjid = Math.floor(objid / 10) + objid % 10 * 10;
                            let content = {object_id: pairObjid, content: text};
                            consumer.task.edit(content);
                            flg = !flg;
                        }
                        //入力中にミニマップと矢印で移動できないようにを解除
                        $('#radio-btn').removeClass('btn-invalid');
                        $('#to-up-button').removeClass('btn-invalid');
                        $('#to-left-button').removeClass('btn-invalid');
                        $('#to-right-button').removeClass('btn-invalid');
                        $('#to-down-button').removeClass('btn-invalid');
                    });
            }
        });

        //左上のミニマップ選択された後
        $('input:radio[name="hoge"]').change(function () {
            const value = $('input:radio[name="hoge"]:checked').val();
            //初期化と連想配列内の値表示
            for (let i = 0; i < 9; i++) {
                let aryid = parseInt(value) + i;
                document.getElementById('zoom_' + i).value = '';
                document.getElementById('zoom_' + i).value = array[aryid];
            }
            localStorage.setItem('radio_value', value);
        });
        $('input[value="40"]').prop('checked', true).change();

        //矢印ボタンでミニマップを移動
        $(function () {
            $('#to-up-button').on('click', upbtn);
            $('#to-left-button').on('click', leftbtn);
            $('#to-right-button').on('click', rightbtn);
            $('#to-down-button').on('click', downbtn);
            function upbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value')) - 30;
                if (radioval >= 0) {
                    console.log("変えるよ")
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }

            function leftbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value')) - 10;
                if (radioval % 30 !== 20) {
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }

            function rightbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value')) + 10;
                if (radioval % 30 !== 0) {
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }

            function downbtn() {
                let radioval = parseInt(localStorage.getItem('radio_value')) + 30;
                if (radioval <= 80) {
                    $('input[value=' + radioval + ']').prop('checked', true).change();
                }
            }
        });

        //チャット
        $(document).on('keypress', '[data-behavior~=idea_speaker]', function (event) {
            if (event.keyCode === 13) {
                if (!event.target.value.match(/\S/g)) return false
                let content = {
                    content: event.target.value
                };
                if (event.target.id === 'idea_chat') {
                    consumer.task.chat(content);
                }
                event.target.value = '';
                return event.preventDefault();
            }
        });

        //全体面とズーム画面の切替
        $('#process_1').hide()
        $(function () {
            $('#allview').on('click', allview);
            $('#zoomview').on('click', zoomview);

            function allview() {
                $('#process_2').hide()
                $('#process_1').show()
            }
            function zoomview() {
                $('#process_1').hide()
                $('#process_2').show()
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
