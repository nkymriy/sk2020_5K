import {checkControllerAction} from "../common/check_controller_action";
require('fomantic-ui-css/semantic.min')

$(document).on("turbolinks:load", function () {
    checkControllerAction(['word_gacha'],['edit'])
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
                display_rank();
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
        display_rank();
        document.getElementById("gacha-word").innerHTML=word_list[display_word_num][1];
    }
    function nextbtn() {
        if (display_word_num == gacha_num - 1){
            display_word_num = - 1;
        }
        display_word_num = display_word_num + 1;
        display_rank();
        document.getElementById("gacha-word").innerHTML=word_list[display_word_num][1];
    }
    function display_rank() {
        let rank_top = document.getElementById("rank_top");
        let rank_bottom = document.getElementById("rank_bottom");

        if (word_list[display_word_num][2]<=10000){
            rank_top.className = 'N_rank';
            rank_bottom.className = 'N_rank';
            rank_top.innerHTML="N";
            rank_bottom.innerHTML="N";
        } else if (word_list[display_word_num][2]<=15000){
            rank_top.className = 'R_rank';
            rank_bottom.className = 'R_rank';
            rank_top.innerHTML="R";
            rank_bottom.innerHTML="R";
        } else if (word_list[display_word_num][2]<=16000){
            rank_top.className = 'SR_rank';
            rank_bottom.className = 'SR_rank';
            rank_top.innerHTML="SR";
            rank_bottom.innerHTML="SR";
        } else {
            rank_top.className = 'SSR_rank';
            rank_bottom.className = 'SSR_rank';
            rank_top.innerHTML="SSR";
            rank_bottom.innerHTML="SSR";
        }
    }
});
