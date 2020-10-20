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
