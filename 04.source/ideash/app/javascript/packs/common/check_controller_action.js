export const checkControllerAction = function ( permit_controllers, permit_actions) {
    let $body = $('body')
    const controller = $body.data('controller')
    const action = $body.data('action')
    console.log(`${controller}#${action}`)
    const rt = permit_controllers.indexOf(controller) >= 0 && permit_actions.indexOf(action) >= 0
    if(rt)console.log(`active ${permit_controllers} # ${permit_actions}`)
    return (permit_controllers.indexOf(controller) >= 0 && permit_actions.indexOf(action) >= 0);
}
