$(function () {
    require('jquery-ui/ui/widgets/draggable')
    $('.chat').draggable();

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

    const showClock2 = function () {
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
    let timerId = setInterval(showClock2, 1000);

});
