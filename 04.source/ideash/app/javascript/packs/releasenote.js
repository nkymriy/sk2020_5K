//CSVファイルを読み込む関数getCSV()の定義
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

    const outputElement = document.getElementById('output_csv');
    let insertElement = '';

    for(var j=0; j<result.length; ++j){
        insertElement += '<tr>';

        for (var k=0; k<4; ++k){
            if(result[j][k]=="new_func"){
                insertElement +=
                    '<td>以下の機能を追加しました。' +
                    '<div class="ui list release_note_list">';
                for (var l=4; l<result[j].length; l=l+2){
                    insertElement +=
                        '<div class="item">' +
                        '<div class="header">'+result[j][l]+'</div>' +
                        result[j][l+1]+'</div>';
                }
                insertElement +=
                    '</div>';
            }else {
                insertElement += '<td>'+result[j][k]+'</td>';
            }
        }
        insertElement += '</tr>';
    }
    outputElement.innerHTML = insertElement;
}

getCSV(); //最初に実行される