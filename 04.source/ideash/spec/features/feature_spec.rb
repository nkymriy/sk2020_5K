require 'rails_helper'

RSpec.describe "Feature", type: :feature do
  before only_path:true do
    #user作成
    User.create(email:'develop1@example.com',password:'password')
  end
  scenario "ブラウザ操作をシュミレートする" do
    #トップページにアクセス
    visit root_path

    #signinページへ遷移
    within('div.btns_1_1') do
      click_on 'Sign In'
    end

    #ここから/account/signin
    #遷移に成功したかの検証(/account/signin)
    expect(page).to have_content 'Sign-In to your account'
    expect(current_path).to eq '/account/signin'
    #loginフォームにemailとpasswordを入力する
    fill_in 'email-id',with: 'develop1@example.com'
    fill_in 'password-id',with: 'password'
    click_on 'Sign In'

    #ここから/idea/home
    #loginして遷移に成功したかの検証(/idea/home)
    expect(current_path).to eq '/idea/home'
    click_link '新規作成'

    #ここから/idea/category
    #遷移に成功したか検証(/idea/category)
    expect(current_path).to eq '/idea/category'
    click_link 'メモ'
    expect(current_path).to eq '/idea/memo/new'
    #headerのIdeashを押しidea/homeに戻る
    click_link 'Ideash'

    #ここから/idea/home
    expect(current_path).to eq '/idea'
    click_link 'ブレインストーミング(β)'

    #ここからidea/brainstorming/new
    expect(current_path).to eq '/idea/brainstorming/new'
    fill_in 'theme',with: 'feature-test'
    click_on 'はじめる'
    # expect(current_path).to eq '/idea/brainstorming/edit/'
    ##あとで
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link 'メモ'

    #ここからidea/memo/new
    expect(current_path).to eq '/idea/memo/new'
    fill_in 'メモに名前をつけてください',with: 'feature-test'
    fill_in 'メモを書きましょう',with: 'feature-memo'
    click_on '保存'
    within all('div.memos').last do
      ##click_link 'feature-test'
      #expect(page).to have_selector 'div.memo-text',text: 'feature-test'
      #find('div.memo-text',text: 'feature-test')
      ##あとでやる
    end
    expect(page).to have_content 'メモを保存しました。'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link '履歴'

    #ここからidea/history
    expect(current_path).to eq '/idea/history'
    within all('tr.feature').first do
      click_link 'メモ'
    end

    #ここからidea/memo/edit/:id
    expect(page).to have_field 'タイトル',with:'feature-test'
    expect(page).to have_field '内容',with:'feature-memo'
    ##更新処理あとでかく
    click_on '更新'
    click_link '履歴'

    #ここから/idea/history
    expect(current_path).to eq '/idea/history'
    click_link 'ブレインストーミング'

    #ここからidea/brainstorming/edit/:id
    expect(page).to have_selector 'h3', text: 'テーマ: feature-test'
    ##あとで
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'







  end
end