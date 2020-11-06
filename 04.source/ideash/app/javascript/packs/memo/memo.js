require('fomantic-ui-css/semantic.min');

$('.message .close')
    .on('click', function () {
        $(this)
            .closest('.message')
            .transition('fade')
        ;
    })
;


$("#memo-submit").click(function(){
    if(!$('#memo-title').val().match(/\S/g) || !$('#memo-content').val().match(/\S/g)){
        $('body')
            .toast({
                title: 'CAUTION',
                message: 'スペース、空欄での入力はできません',
                showProgress: 'bottom',
                classProgress: 'red'
            });
        return false;
    }
});

$(function () {
    memo_save()
})

function memo_save() {
    let info_message = $('#memo_save').val();
    if(info_message === 'success'){
        $('body')
            .toast({
                title: 'SUCCESS',
                message: 'メモを保存しました。',
                showProgress: 'bottom',
                classProgress: 'blue'
            });
    }else if (info_message === 'update'){
        $('body')
            .toast({
                title: 'SUCCESS',
                message: 'メモを更新しました。',
                showProgress: 'bottom',
                classProgress: 'green'
            });
    }else if (info_message === 'fail'){
        $('body')
            .toast({
                title: 'CAUTION',
                message: 'メモの保存に失敗しました。再度やり直してください。',
                showProgress: 'bottom',
                classProgress: 'red'
            });
    }
}