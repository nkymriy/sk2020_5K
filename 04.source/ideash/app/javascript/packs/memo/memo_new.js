require('fomantic-ui-css/semantic.min');

$('.message .close')
    .on('click', function () {
        $(this)
            .closest('.message')
            .transition('fade')
        ;
    })
;

$("input[id='memo-title'],[id='memo-content']").blur(function(){
    if(!$(this).val().match(/\S/g)){
        $(this).css("background-color", "#FEF4F8");
        $('#memo-submit').prop('disabled', true);
        $('body')
            .toast({
                title: 'CAUTION',
                message: 'スペース、空白のみでの入力はできません',
                showProgress: 'bottom',
                classProgress: 'red'
            });
    }else{
        $(this).css("background-color", "#FaFEFF");
        $('#memo-submit').prop('disabled', false)
    }
});