import {checkControllerAction} from "./check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['brainstorming', 'mandarat'], ['new'])) return
    // NOTE: テーマを入力しないとアイデアを作成できないようにする処理
    $("input[id='theme']").blur(function () {
        if (!$(this).val().match(/\S/g)) {
            $(this).css('background-color', '#FEF4F8');
            $('#start_button').prop('disabled', true)
        } else {
            $(this).css('background-color', '#FaFEFF');
            $('#start_button').prop('disabled', false)
        }
    });

    $('#theme').keydown(function (event) {
        $('#start_button').prop('disabled', false)
    })

    $('#is_unlimited').click(function () {
        if (this.checked) {
            $('#process1').prop('disabled', true)
            $('#process2').prop('disabled', true)
            $('#process3').prop('disabled', true)
        } else {
            $('#process1').prop('disabled', false)
            $('#process2').prop('disabled', false)
            $('#process3').prop('disabled', false)
        }
    });
});
