export const checkControllerAction = function ( permit_controllers, permit_actions) {
    let $body = $('body')
    const controller = $body.data('controller')
    const action = $body.data('action')
    return (permit_controllers.indexOf(controller) >= 0 && permit_actions.indexOf(action) >= 0);
}
