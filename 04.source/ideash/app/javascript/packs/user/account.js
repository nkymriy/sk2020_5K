import {checkControllerAction} from "../common/check_controller_action";

require('fomantic-ui-css/semantic.min');
$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['registrations'],['profile_edit'])) return;
    toast_updated();

    function toast_updated() {
        let is_updated = $('#is_updated').val();
        // 初回時は空白になるのでそのまま返す
        if (is_updated === "") return;
        let user_name = $('#account_input').val();
        if (is_updated) {
            $('body')
                .toast({
                    title: 'SUCCESS',
                    message: user_name + 'に更新しました',
                    showProgress: 'bottom',
                    classProgress: 'blue'
                });
        } else {
            $('body')
                .toast({
                    title: 'FAILURE',
                    message: '更新に失敗しました。',
                    showProgress: 'bottom',
                    classProgress: 'red'
                });
        }
    }
});

