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
                    let first1 = '.t'; let first2 = 'zoom_';
                    let sel_num = parseInt(query["edit"]["object_id"])-val;
                    let sel_class = first1 + sel_num;
                    let sel_id = first2 + sel_num;
                    $(sel_class).css('background-color', '#FFFFFF');
                    //console.log(sel_class);
                    document.getElementById(sel_id).value = query["edit"]["content"];
                    //console.log(sel_id);
                    console.log("focusout");
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

        $('input:radio[name="hoge"]').change(function() {
            const value = $('input:radio[name="hoge"]:checked').val();
            console.log(value);
            localStorage.setItem('radio_value', value);
        });
        $('input[value="40"]').prop('checked', true).change();

        // let element = document.getElementById( "target" );
        // console.log(element);
        // let radioNodeList = element.hoge;
        // console.log(radioNodeList);
        // let radio_num = radioNodeList.value;
        // if ( radio_num === "" ) {
        //     // 未選択状態
        // } else {
        //     console.log( radio_num );
        // }

    } else {
        if (consumer.task) {
            consumer.task.unsubscribe()
        }
    }
});