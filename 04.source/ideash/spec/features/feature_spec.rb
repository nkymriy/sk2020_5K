require 'rails_helper'

RSpec.describe "Feature", type: :feature do
  before only_path:true do
    #user作成
    User.create(email:'develop1@example.com',password:'password')
  end
  scenario "ブラウザ操作をシュミレートする", js:true do
    #トップページにアクセス
    visit root_path

    #signinページへ遷移
    within('div.btns_1_1') do
      click_on 'Sign In'
    end

    #ここから/account/signin
    expect(current_path).to eq '/account/signin'
    #loginフォームにemailとpasswordを入力する
    fill_in 'feature-test-email',with: 'develop1@example.com'
    fill_in 'feature-test-password',with: 'password'
    click_on 'Sign In'

    #ここから/idea/home
    #loginして遷移に成功したかの検証(/idea/home)
    expect(current_path).to eq '/idea/home'
    click_link '新規作成'

    #ここからidea/category
    expect(current_path).to eq '/idea/category'
    click_link 'Memo'

    #ここからidea/memo/new
    expect(current_path).to eq '/idea/memo/new'
    fill_in 'メモに名前をつけてください',with: 'feature-test'
    fill_in 'メモを書きましょう',with: 'feature-memo'
    click_on '保存'
    click_link 'feature-test'

    #ここからidea/memo/edit/:id
    expect(page).to have_field 'タイトル',with:'feature-test'
    expect(page).to have_field '内容',with:'feature-memo'
    click_link '履歴'

    #ここからidea/history
    expect(current_path).to eq '/idea/history'
    click_link '新規作成'

    #ここから/idea/category
    #遷移に成功したか検証(/idea/category)
    expect(current_path).to eq '/idea/category'
    click_link 'Brainstorming'

    #ここからidea/brainstorming/new
    expect(current_path).to eq '/idea/brainstorming/new'
    fill_in 'theme',with: 'feature-test'
    click_on 'はじめる'
    #idea/brainstorming/edit/:id
    expect(page).to have_selector 'h3', text: 'テーマ: feature-test'
    fill_in '思いついたことを書いていきましょう', with: 'feature-bra'
    find('#feature-test-brainstorming').native.send_keys(:return)
    click_link '新規作成'

    #ここからidea/category
    expect(current_path).to eq '/idea/category'
    click_link 'マンダラート'

    #ここからidea/mandarat/new
    expect(current_path).to eq '/idea/mandarat/new'
    fill_in 'theme',with: 'feature-test'
    click_on 'はじめる'
    click_link '単語スロット'

    #ここからidea/word_slot/edit
    expect(current_path).to eq '/idea/word_slot/edit'
    expect(page).to have_content '回す'
    click_link '単語ガチャ'

    #ここからidea/word_gacha/edit
    expect(current_path).to eq '/idea/word_gacha/edit'
    expect(page).to have_content '回す'
    click_link 'アカウント'

    #ここからidea/account
    expect(current_path).to eq '/account/edit'
    fill_in 'account_input',with: 'test_name'
    click_on 'Update'
    click_link 'SignOut'

    #ここからtop/index
    expect(current_path).to eq '/'
    ##リリースノートの処理あとで
    click_link 'home　｜　'
    expect(current_path).to eq '/'
    click_link 'concept'
    expect(current_path).to eq '/'
    click_link 'about'
    expect(current_path).to eq '/'
    within('div.btns_2_1') do
      click_on 'Sign In'
    end

    #ここからaccount/signin再度ログイン
    expect(current_path).to eq '/account/signin'
    #loginフォームにemailとpasswordを入力する
    fill_in 'feature-test-email',with: 'develop1@example.com'
    fill_in 'feature-test-password',with: 'password'
    click_on 'Sign In'

  end
end
