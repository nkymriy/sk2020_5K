import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['ideas'], ['category'])) return

    $('#memo-more-info').on('click', memo_info_btn);
    $('#brainstorming-more-info').on('click', brainstorming_info_btn);
    $('#mandarat-more-info').on('click', mandarat_info_btn);
    $('#word-gacha-more-info').on('click', word_gacha_info_btn);
    $('#word-slot-more-info').on('click', word_slot_info_btn);

    function memo_info_btn() {
        $('#memo-more-info').modal('show');
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--メモの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    };
    function brainstorming_info_btn() {
        $('#brainstorming-more-info').modal('show');
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--ブレインストーミングの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    }
    function mandarat_info_btn() {
        $('#mandarat-more-info').modal('show');
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--マンダラートの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    }
    function word_gacha_info_btn() {
        $('#word-gacha-more-info').modal('show');
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--単語ガチャの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    }
    function word_slot_info_btn() {
        $('#word-slot-more-info').modal('show');
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--単語スロットの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
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