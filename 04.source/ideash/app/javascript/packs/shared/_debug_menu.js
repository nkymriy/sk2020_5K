$(document).on("turbolinks:load", function () {
    $('body').keydown(function (e) {
        // alert(JSON.stringify(e.keyCode))
        // Shift + d を入力するとデバッグメニューを表示する
        if (e.shiftKey) {
            if (e.keyCode === 68) {
                $('#debug-modal-window').modal('show');
            }
        }
    });

});
