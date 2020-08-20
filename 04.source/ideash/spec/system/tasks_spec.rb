require 'rails_helper'
describe 'タスク管理画面一覧', type: :system do
  describe '一覧表示機能' do
    before do
# ユーザーAを作成しておく
# 作成者がユーザーAであるタスクを作成しておく
      user_a = FactoryBot.create(:user, user_name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:task, user_name: '最初のタスク', user: user_a)
    end
    context 'ユーザーAがログインしているとき' do
      before do
         visit account_signin_path
         fill_in 'メールアドレス',with: 'a@example.com'
         fill_in 'パスワード',with: 'password'
         click_button 'ログインする'
# ユーザーAでログインする
      end
      it 'ユーザーAが作成したタスクが表示される' do
# 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end