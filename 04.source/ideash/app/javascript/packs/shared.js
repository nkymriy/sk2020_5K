//読み込み時の表示
window_load();
//ウィンドウサイズ変更時に更新
window.onresize = window_load;
//サイズの表示
function window_load() {
    var display_Width = window.parent.screen.width;
    var window_Width = window.innerWidth;
    var key_Width = display_Width / 3 * 2;

    let home_menu=document.getElementById('home_menu');
    let edit_menu=document.getElementById('edit_menu');
    let home_body = document.getElementById('home_body');
    let edit_body = document.getElementById('edit_body');
    let idea_card =document.getElementById('ideas');

    if (window_Width <= key_Width) {
        home_menu.className = 'ui left fixed vertical inverted small menu';

        if (home_body != null){
            home_body.className = 'home_body thin_margin_left';
        }
        if (edit_body != null){
            edit_body.className = 'home_body thin_margin_right thin_margin_left';
        }
        if (edit_menu != null){
            edit_menu.className = 'ui right fixed vertical small menu block-edit-sidebar';
        }
        if (idea_card != null){
            idea_card.classList.replace('four', 'two');
        }
    } else {
        home_menu.className = 'ui left fixed vertical inverted menu';

        if (home_body != null){
            home_body.className = 'home_body wide_margin_left';
        }
        if (edit_body != null){
            edit_body.className = 'home_body wide_margin_right wide_margin_left';
        }
        if (edit_menu != null) {
            edit_menu.className = 'ui right fixed vertical menu block-edit-sidebar';
        }
        if (idea_card != null) {
            idea_card.classList.replace('two', 'four');
        }
    }
}