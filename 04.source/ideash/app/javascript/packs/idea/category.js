import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['ideas'], ['category'])) return

    $('#memo-more-info').on('click', memo_info_btn);
    $('#brainstorming-more-info').on('click', brainstorming_info_btn);
    $('#mandarat-more-info').on('click', mandarat_info_btn);
    $('#word-gacha-more-info').on('click', word_gacha_info_btn);
    $('#word-slot-more-info').on('click', word_slot_info_btn);

    function memo_info_btn() {
        $('#memo-modal-window').modal('show');
    };

    function brainstorming_info_btn() {
        $('#brainstorming-modal-window').modal('show');
    }

    function mandarat_info_btn() {
        $('#mandarat-modal-window').modal('show');
    }

    function word_gacha_info_btn() {
        $('#word-gacha-model-window').modal('show');
    }

    function word_slot_info_btn() {
        $('#word-slot-model-window').modal('show');
    }

    $('.js-modal-open').on('click', function () {
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click', function () {
        $('.js-modal').fadeOut();
        return false;
    });


});