import {checkControllerAction} from "./check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['brainstorming', 'mandarat'], ['new'])) return
    // NOTE: テーマを入力しないとアイデアを作成できないようにする処理
    let $process1 = $("#process_1")
    let $process2 = $("#process_2")
    let $process3 = $("#process_3")

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
            $process1.prop('disabled', true)
            $process2.prop('disabled', true)
            $process3.prop('disabled', true)
        } else {
            $process1.prop('disabled', false)
            $process2.prop('disabled', false)
            $process3.prop('disabled', false)
        }
    });

    function sliderStep5(value) {
        if ((value + 1) % 5 !== 0) return " "
        return value + 1
    }

    $('#brainstorming_slider_process1').slider({
        min: 1,
        max: 30,
        start: 10,
        interpretLabel: function (value) {
            return sliderStep5(value)
        },
        onChange: function (value) {
            $process1.val(value)
        }
    });

    $('#brainstorming_slider_process2').slider({
        min: 1,
        max: 30,
        start: 5,
        interpretLabel: function (value) {
            return sliderStep5(value)
        },

        onChange: function (value) {
            $process2.val(value)
        }
    });

    $('#brainstorming_slider_process3').slider({
        min: 1,
        max: 30,
        start: 15,
        interpretLabel: function (value) {
            return sliderStep5(value)
        },

        onChange: function (value) {
            $process3.val(value)
        }
    });
    $('#mandarat_slider_process1').slider({
        min: 1,
        max: 30,
        start: 20,

        onChange: function (value) {
            $process1.val(value)
        }
    });

});
