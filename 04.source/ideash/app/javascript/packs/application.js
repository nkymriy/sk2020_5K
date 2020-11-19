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
require("jquery-ui/ui/widgets/draggable")


// fomantic-uiの読み込み
import 'fomantic-ui-css/semantic.min.css'
require('fomantic-ui-css/semantic')

// 共有js
// require('./common/check_controller_action')
require('./shared')
require('./shared/_right_menu')

// 各コントローラー用
// idea新規作成画面
require('./common/new')
//top
require('./top')
//user#edit
require('./user/account')
//memo#memo
require('./memo/memo')
//brainstorming#edit
require('./idea/brainstorming_channel')
//mandarat#edit
require('./idea/mandarat_channel')
//word_gacha
require('./idea/word_gacha')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
