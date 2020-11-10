require('fomantic-ui-css/semantic.min');

$(function () {
    //読み込み時の表示
    $('#main_content').fadeIn(500);
    $('.popup').popup();
    $('#left_menu_show_button').on('click', function () {
        $('#left_menu').show();
        $('#left_icon_menu').hide()
    });
    $('#left_menu_hide_button').on('click', function () {
        $('#left_menu').hide();
        $('#left_icon_menu').show()
    });


//     window_load();
// //ウィンドウサイズ変更時に更新
//     window.onresize = window_load;
//
// //サイズの表示
//     function window_load() {
//         var display_Width = window.parent.screen.width;
//         var window_Width = window.innerWidth;
//         var key_Width = display_Width / 3 * 2;
//
//         let left_menu = document.getElementById('left_menu');
//         let left_menu = document.getElementById('left_menu');
//         let home_body = document.getElementById('home_body');
//         let edit_body = document.getElementById('edit_body');
//         let idea_card = document.getElementById('ideas');
//
//         if (window_Width <= key_Width) {
//             left_menu.className = 'ui left fixed small vertical inverted menu';
//             if (home_body) home_body.className = 'home_body thin_margin_left';
//             if (edit_body) edit_body.className = 'home_body thin_margin_right thin_margin_left';
//             if (left_menu) left_menu.className = 'ui right fixed vertical small menu block-edit-sidebar';
//             if (idea_card) idea_card.classList.replace('four', 'two');
//         } else {
//             left_menu.className = 'ui left fixed vertical inverted menu';
//             if (home_body) home_body.className = 'home_body wide_margin_left';
//             if (edit_body) edit_body.className = 'home_body wide_margin_right wide_margin_left';
//             if (left_menu) left_menu.className = 'ui right fixed vertical menu block-edit-sidebar';
//             if (idea_card) idea_card.classList.replace('two', 'four');
//         }
//     }
});
