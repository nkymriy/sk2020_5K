$(document).on("turbolinks:load", function () {
    require('fomantic-ui-css/semantic.min')


    let word_list
    let anime_list

    let rotationLeft
    let rotationCenter
    let rotationRight

    //ガチャを回す
    $('#turn-slot-button').on('click', turnbtn);
    $('#stop-left-button').on('click', stop_left);
    $('#stop-center-button').on('click',stop_center);
    $('#stop-right-button').on('click',stop_right);
    
    function turnbtn() {
        $.ajax({
            url: "get_wordslot_jsons",
            type: "GET",
            data: {gacha_num: 20},
            success: function (data) {
                anime_list = data;
            },
            error: function (data) {
                //失敗時の処理
            }
        });
        $.ajax({
            url: "get_wordslot_jsons",
            type: "GET",
            data: {gacha_num: 3},
            success: function (data) {
                word_list = data;
                rotationLeft = setInterval(rotation_left, 200);
                rotationCenter = setInterval(rotation_center, 200);
                rotationRight = setInterval(rotation_right, 200);

            },
            error: function (data) {
                //失敗時の処理
            }
        });
    }

    function stop_left() {
        clearInterval(rotationLeft);
        document.getElementById('slot-word-left').innerHTML = word_list[0][1];
    }
    function stop_center() {
        clearInterval(rotationCenter);
        document.getElementById('slot-word-center').innerHTML = word_list[1][1];
    }
    function stop_right() {
        clearInterval(rotationRight);
        document.getElementById('slot-word-right').innerHTML = word_list[2][1];
    }


    var min = 1 ;
    var max = 19 ;

    function rotation_left() {
        var rand = Math.floor( Math.random() * (max + 1 - min) ) + min ;
        document.getElementById('slot-word-left').innerHTML = anime_list[rand][1];
    }
    function rotation_center() {
        var rand = Math.floor( Math.random() * (max + 1 - min) ) + min ;
        document.getElementById('slot-word-center').innerHTML = anime_list[rand][1];
    }
    function rotation_right() {
        var rand = Math.floor( Math.random() * (max + 1 - min) ) + min ;
        document.getElementById('slot-word-right').innerHTML = anime_list[rand][1];
    }

});
