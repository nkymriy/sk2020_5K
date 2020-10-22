require('fomantic-ui-css/semantic.min');
$(function(){
    let is_updated = $('#is_updated').val() ?? false;
    let is_updated_check = $('#is_updated_check').val();
    console.log (is_updated_check + "check");
    console.log (is_updated);
    let user_name = $('#account_input').val();

    if(is_updated_check) {
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
})
