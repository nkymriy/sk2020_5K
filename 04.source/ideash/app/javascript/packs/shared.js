document.addEventListener("turbolinks:load", function () {
    //読み込み時の表示
    $('.fade_object').fadeIn(500);
    $('.popup').popup();

    //サイドバーの開閉ボタン
    $('#left_menu_show_button').on('click', function () {
        $('#left_menu').show();
        $('#left_icon_menu').hide()
    });
    $('#left_menu_hide_button').on('click', function () {
        $('#left_menu').hide();
        $('#left_icon_menu').show()
    });

    $('#right_menu_show_button').on('click', function () {
        $('#right_menu').show();
        $('#right_icon_menu').hide()
    });
    $('#right_menu_hide_button').on('click', function () {
        $('#right_menu').hide();
        $('#right_icon_menu').show()
    });
});
