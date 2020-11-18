$(document).on("turbolinks:load", function () {
    require('fomantic-ui-css/semantic.min')

    //ガチャを回す
    $('#turn-slot-button').on('click', turnbtn);
    let gacha_num = 3;
    let word_list

    function turnbtn() {
        $.ajax({
            url: "get_wordslot_jsons",
            type: "GET",
            data: {gacha_num:gacha_num},
            success: function(data){
                console.log(gacha_num)
                word_list = data;
                document.getElementById("slot-word-left").innerHTML=word_list[0][1];
                document.getElementById("slot-word-center").innerHTML=word_list[1][1];
                document.getElementById("slot-word-right").innerHTML=word_list[2][1];

            },
            error: function(data){
                //失敗時の処理
            }
        });
    }
});
