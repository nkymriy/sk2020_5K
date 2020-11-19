// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("jquery")
require("jquery-ui")

// fomantic-uiの読み込み
import 'fomantic-ui-css/semantic.min.css'

// 共有js
require('./common/check_controller_action')

// 各コントローラー用
// idea新規作成画面
require('./common/new')
//top
require('./top')
//brainstormingのedit画面
require('./idea/brainstorming_channel')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
