require('fomantic-ui-css/semantic.min');
import {checkControllerAction} from "./common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['top'], ['index'])) return
    $('.accordion').accordion()
});