$(document).on("turbolinks:load", function () {
    require('fomantic-ui-css/semantic.min')
    $('.ui.dropdown').dropdown()

    //ガチャを回す
    $('#turn-gacha-button').on('click', turnbtn);
    let gacha_num = 0;
    let display_word_num = 0;
    let word_list

    function turnbtn() {
        gacha_num= $('#gacha-select').val();

        $.ajax({
            url: "get_wordgacha_jsons",
            type: "GET",
            data: {gacha_num:gacha_num},
            success: function(data){
                word_list = data;
                display_word_num = 0;
                document.getElementById("gacha-word").innerHTML=word_list[display_word_num][1];
            },
            error: function(data){
                //失敗時の処理
            }
        });
    }


    //移動ボタン
    $('#to-previous-button').on('click', previousbtn);
    $('#to-next-button').on('click', nextbtn);

    function previousbtn() {
        if (display_word_num == 0){
            display_word_num = gacha_num;
        }
        display_word_num = display_word_num - 1;
        document.getElementById("gacha-word").innerHTML=word_list[display_word_num][1];
    }
    function nextbtn() {
        if (display_word_num == gacha_num - 1){
            display_word_num = - 1;
        }
        display_word_num = display_word_num + 1;
        document.getElementById("gacha-word").innerHTML=word_list[display_word_num][1];
    }
});
