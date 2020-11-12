$(function () {
    require('fomantic-ui-css/semantic.min');
    require('jquery-ui/ui/widgets/draggable')
    //$('.chat').draggable();

    jQuery( function() {
        $('.chat').draggable( {
            containment: '#jquery-ui-draggable',
            scroll: false
        } );
    } );

    // let clipboard = new Clipboard('.copy');
    let timerId = setInterval(showClock2, 1000);
    showClock2(timerId)

    $('#copy_invite_link').on('click', function (e) {
        // 空div 生成
        var tmp = document.createElement("div");
        // 選択用のタグ生成
        var pre = document.createElement('pre');

        // 親要素のCSSで user-select: none だとコピーできないので書き換える
        pre.style.userSelect = 'auto';

        tmp.appendChild(pre).textContent = $(e.target).val();

        // 要素を画面外へ
        var s = tmp.style;
        s.position = 'fixed';
        s.right = '200%';

        // body に追加
        document.body.appendChild(tmp);
        // 要素を選択
        document.getSelection().selectAllChildren(tmp);

        // クリップボードにコピー
        if (document.execCommand("copy")) {
            $('body')
                .toast({
                    title: 'COPIED INVITE LINK!',
                    message: '招待リンクをコピーしました！友達に送ろう！',
                    showProgress: 'bottom',
                    classProgress: 'blue'
                });
        }
        // 要素削除
        document.body.removeChild(tmp);
    });

    $('#reset_chat_position').on('click', function () {
        $('.item').removeAttr('style')
    })
});

function set2fig(num) {
    // 桁数が1桁だったら先頭に0を加えて2桁に調整する
    var ret;
    if (num < 10) {
        ret = "0" + num;
    } else {
        ret = num;
    }
    return ret;
}

function showClock2(timerId) {
    var nowTime = new Date();
    var nowHour = set2fig(nowTime.getHours());
    var nowMin = set2fig(nowTime.getMinutes());
    var nowSec = set2fig(nowTime.getSeconds());
    var msg = nowHour + ":" + nowMin + ":" + nowSec;
    if ($('#RealtimeClockArea2').length === 0) {
        clearInterval(timerId)
    } else {
        document.getElementById("RealtimeClockArea2").innerHTML = msg;
    }
}