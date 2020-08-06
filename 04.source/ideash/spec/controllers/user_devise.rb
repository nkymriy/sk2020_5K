#テスト環境でdeviseにログイン
#
require 'rails_helper'

describe devise, type: :controller do
  let(:user) { create(:user) }
  # userをcreateし、let内に格納

  describe 'GET #index' do
    before do
      login_user user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    it "renders the :index template" do
    end
  end
end


