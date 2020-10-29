// TODO: 見栄えを良くする
// NOTE: テーマを入力しないとアイデアを作成できないようにする処理
$("input[id='theme']").blur(function () {
    if (!$(this).val().match(/\S/g)) {
        $(this).css("background-color", "#FEF4F8");
        $('#start_button').prop('disabled', true)
    } else {
        $(this).css("background-color", "#FaFEFF");
        $('#start_button').prop('disabled', false)
    }
});

$('#theme').keydown(function(event) {
    $('#start_button').prop('disabled', false)
})
