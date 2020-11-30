import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    checkControllerAction(['word_gacha'],['edit'])
    $('.ui.dropdown').dropdown()

    //ガチャを回す
    $('#turn-gacha-button').on('click', turnbtn);
    //閉じる
    $('#close-card-area').on('click', closebtn);

    const wordCards = document.getElementById("word-cards");
    wordCards.style.display ="none";


    let word_list

    function turnbtn() {
        $.ajax({
            url: "get_wordgacha_jsons",
            type: "GET",
            data: {gacha_num:10},
            success: function(data){
                word_list = data;
                display_cards();
            },
            error: function(data){
                //失敗時の処理
            }
        });
    }

    function display_cards() {

        let rank_class;
        let rank_text;

        let newParent =
            '<div id="cards_area"></div>'
        ;

        $(newParent).appendTo('#word-cards');

        for(let i=0;i<10;i++){

            console.log(word_list)

            if (word_list[i][2]<=10000){
                rank_class = 'N_rank';
                rank_text="N";
            } else if (word_list[i][2]<=15000){
                rank_class = 'R_rank';
                rank_text="R";
            } else if (word_list[i][2]<=16000){
                rank_class = 'SR_rank';
                rank_text="SR";
            } else {
                rank_class = 'SSR_rank';
                rank_text="SSR";
            }

            let newCard =
                '<div class="word-card">' +
                '<div class="rank_top '+rank_class+'">'+rank_text+'</div>' +
                '<h1>'+word_list[i][1]+'</h1>' +
                '<div class="rank_bottom '+rank_class+'">'+rank_text+'</div>' +
                '</div>'
            ;

            $(newCard).appendTo('#cards_area');

        }

        wordCards.style.display ="block";

    }

    function closebtn() {

        let cardsArea = document.getElementById('cards_area');
        let cardsAreaParent = cardsArea.parentNode;
        cardsAreaParent.removeChild(cardsArea);

        wordCards.style.display ="none";

    }
});
