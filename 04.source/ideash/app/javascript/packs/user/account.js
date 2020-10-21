require('fomantic-ui-css/semantic.min');
$(function(){
    let is_updated = $('#is_updated').val() ?? false;
    console.log (is_updated);

    if(is_updated == 'true'){
        $('body')
            .toast({
                title: 'SUCCESS',
                message: '更新に成功しました',
                showProgress: 'bottom',
                classProgress: 'blue'
            });
    }else{
        $('body')
            .toast({
                title: 'FAILURE',
                message: '更新に失敗しました。',
                showProgress: 'bottom',
                classProgress: 'red'
            });
    }
})
