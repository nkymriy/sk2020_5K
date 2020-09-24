require 'rails_helper'

RSpec.describe "Feature", type: :feature do
  before do
    #user作成
    #User.create!(email:'develop1@example.com',password:'password')

    #ユーザを作成
    # @user = User.create(
    #     email:"develop1@example.com",
    #     passsword:"password"
    # )
  end
  scenario "ブラウザ操作をシュミレートする" do

    #トップページにアクセス
    visit root_path

    #signinページへ遷移
    within("div.btns_1_1") do
      click_on 'Sign In'
    end
  end
end
