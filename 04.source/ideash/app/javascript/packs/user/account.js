require('fomantic-ui-css/semantic.min');
$(function(){
    let is_updated = $('#is_updated').val();
    let user_name = $('#account_input').val();

    if (is_updated){
        $('body')
            .toast({
                title: 'SUCCESS',
                message: user_name + 'に更新しました',
                showProgress: 'bottom',
                classProgress: 'blue'
            });
    }else if (is_updated === false){
        $('body')
            .toast({
                title: 'FAILURE',
                message: '更新に失敗しました。',
                showProgress: 'bottom',
                classProgress: 'red'
            });
    }else{
        //初回の処理
    }
})
