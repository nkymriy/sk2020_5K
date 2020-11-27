import {checkControllerAction} from "../common/check_controller_action";

$(document).on("turbolinks:load", function () {
    if (!checkControllerAction(['ideas'], ['category'])) return


});