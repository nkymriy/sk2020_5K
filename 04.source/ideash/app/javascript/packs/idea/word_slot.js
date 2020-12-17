import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['word_slot'], ['edit'])) return;
    const WORD_SIZE = 20;

    let slotMachine = {
        "turnButton": $('#turn-slot-button'),
        "left": {
            "button": $('#stop-left-button'),
            "reel": $('#slot-word-left'),
            "interval": "",
            "index": getRandomInt(WORD_SIZE),
            "isSpinning": false,
        },
        "center": {
            "button": $('#stop-center-button'),
            "reel": $('#slot-word-center'),
            "index": getRandomInt(WORD_SIZE),
            "interval": "",
            "isSpinning": false,
        },
        "right": {
            "button": $('#stop-right-button'),
            "reel": $('#slot-word-right'),
            "index": getRandomInt(WORD_SIZE),
            "interval": "",
            "isSpinning": false,
        },
        "spinCount": 0,
        "wordList": []
    }

    slotMachine.turnButton.on('click', turnSlot);
    slotMachine.left.button.on('click', {"position": "left"}, stopReel);
    slotMachine.center.button.on('click', {"position": "center"}, stopReel);
    slotMachine.right.button.on('click', {"position": "right"}, stopReel);

    function turnSlot() {
        if (slotMachine.spinCount > 0) return;
        $.ajax({
            url: "get_wordslot_jsons",
            type: "GET",
            data: {gacha_num: WORD_SIZE},
            success: function (data) {
                slotMachine.wordList = data;
                slotMachine.left.interval = setInterval(spinReel, 50+getRandomInt(100), "left");
                slotMachine.left.isSpinning = true;
                slotMachine.center.interval = setInterval(spinReel, 50+getRandomInt(100), "center");
                slotMachine.center.isSpinning = true;
                slotMachine.right.interval = setInterval(spinReel, 50+getRandomInt(100), "right");
                slotMachine.right.isSpinning = true;
                slotMachine.spinCount = 3
            }
        });
    }

    function spinReel(position) {
        slotMachine[position].index += 1
        if (slotMachine[position].index >= WORD_SIZE) {
            slotMachine[position].index = 0
        }
        slotMachine[position].reel.text(slotMachine.wordList[slotMachine[position].index][1]);
    }

    function stopReel(eo) {
        let position = eo.data.position;
        if (slotMachine[position].isSpinning) {
            slotMachine[position].isSpinning = false;
            clearInterval(slotMachine[position].interval);
            slotMachine.spinCount -= 1
        }
    }
});

//乱数取得
function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}
