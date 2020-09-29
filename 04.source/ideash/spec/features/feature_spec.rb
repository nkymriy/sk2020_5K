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
    #idea/brainstorming/edit/:id
    ##部屋には入ってるあとは入力
    expect(page).to have_selector 'h3', text: 'テーマ: feature-test'
    fill_in('思いついたことを書いていきましょう',with: 'feature-bra')
    expect(page).to have_content 'feature-bra'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link 'メモ'

    #ここからidea/memo/new
    expect(current_path).to eq '/idea/memo/new'
    fill_in 'メモに名前をつけてください',with: 'feature-test'
    fill_in 'メモを書きましょう',with: 'feature-memo'
    click_on '保存'
    expect(page).to have_content 'メモを保存しました。'
    click_link 'feature-test'

    #ここからidea/memo/edit/:id
    expect(page).to have_field 'タイトル',with:'feature-test'
    expect(page).to have_field '内容',with:'feature-memo'
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
    fill_in 'メモに名前をつけてください',with: 'feature-tes'
    fill_in 'メモを書きましょう',with: 'feature-mem'
    click_on '更新'
    #idea/memo/new
    expect(page).to have_content 'メモを更新しました'
    click_link 'feature-tes'
    #idea/memo/edit/:id
    expect(page).to have_field 'タイトル',with:'feature-tes'
    expect(page).to have_field '内容',with:'feature-mem'
    click_link '履歴'

    #ここから/idea/history
    expect(current_path).to eq '/idea/history'
    click_link 'ブレインストーミング'

    #ここからidea/brainstorming/edit/:id
    expect(page).to have_selector 'h3', text: 'テーマ: feature-test'
    ##上のブレストの処理が終わってからやる
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link 'アカウント'

    #ここからidea/account
    expect(current_path).to eq '/idea/account'
    tds = page.all('td')
    has_field?(tds[0])
    has_field?(tds[1])
    has_field?(tds[2])
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link 'サインアウト'

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
    fill_in 'email-id',with: 'develop1@example.com'
    fill_in 'password-id',with: 'password'
    click_on 'Sign In'

    #ここからidea/home
    expect(current_path).to eq '/idea/home'
    click_link 'Memo'

    #ここからidea/memo/new
    expect(current_path).to eq '/idea/memo/new'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    click_link 'Brainstorming'

    #ここからidea/brainstorming/new
    expect(current_path).to eq '/idea/brainstorming/new'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    within('div.creat_new_segment') do
      click_link 'more'
    end

    #ここからidea/category
    expect(current_path).to eq '/idea/category'
    click_link 'Memo'

    #ここからidea/memo/new
    expect(current_path).to eq '/idea/memo/new'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    within('div.creat_new_segment') do
      click_link 'more'
    end

    #ここからidea/category
    expect(current_path).to eq '/idea/category'
    click_link 'Brainstorming'

    #ここからidea/brainstorming/new
    expect(current_path).to eq '/idea/brainstorming/new'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
    within('div.recent_creation_segment') do
      click_link 'more'
    end

    #ここからidea/history
    expect(current_path).to eq '/idea/history'
    click_link 'Ideash'

    #ここからidea/home
    expect(current_path).to eq '/idea'
  end
end