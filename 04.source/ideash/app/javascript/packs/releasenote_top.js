function getCSV(){
    var req = new XMLHttpRequest(); // HTTPでファイルを読み込むためのXMLHttpRrequestオブジェクトを生成
    req.open("get", "releasenote.csv", true); // アクセスするファイルを指定
    req.send(null); // HTTPリクエストの発行

    var array =[];

    // レスポンスが返ってきたらconvertCSVtoArray()を呼ぶ
    req.onload = function(){
        convertCSVtoArray(req.responseText); // 渡されるのは読み込んだCSVデータ
    }
}

// 読み込んだCSVデータを二次元配列に変換する関数convertCSVtoArray()の定義
function convertCSVtoArray(str){ // 読み込んだCSVデータが文字列として渡される
    var result = []; // 最終的な二次元配列を入れるための配列
    var tmp = str.split("\n"); // 改行を区切り文字として行を要素とした配列を生成

    // 各行ごとにカンマで区切った文字列を要素とした二次元配列を生成
    for(var i=0;i<tmp.length;++i){
        result[i] = tmp[i].split(',');
    }

    const outputElement = document.getElementById('output_csv_top');
    let insertElement = '';

    for(var j=0; j<result.length; ++j){
        insertElement +=
            '<div class="item">' +
            '<i class="angle right icon"></i>' +
            '<div class="content">' +
            '<a class="header" href="/releasenote">'+result[j][2]+'</a>' +
            '<div class="description">'+result[j][1]+'</div>' +
            '</div>' +
            '</div>';
    }
    outputElement.innerHTML = insertElement;
}

getCSV();
