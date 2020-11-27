import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['ideas'], ['category'])) return

    $('#category1').on('click', category_btn1);
    $('#category2').on('click', category_btn2);
    $('#category3').on('click', category_btn3);
    $('#category4').on('click', category_btn4);

    function category_btn1() {
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--メモの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    };
    function category_btn2() {
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--ブレインストーミングの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    }
    function category_btn3() {
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--マンダラートの説明--</p>\n' +
            '          <a class="js-modal-close" href="">閉じる</a>\n' +
            '        </div><!--modal__inner-->\n' +
            '      </div><!--modal-->')
    }
    function category_btn4() {
        $('body').append('<div class="modal js-modal">\n' +
            '        <div class="modal__bg js-modal-close"></div>\n' +
            '        <div class="modal__content">\n' +
            '          <p>--単語ガチャの説明--</p>\n' +
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