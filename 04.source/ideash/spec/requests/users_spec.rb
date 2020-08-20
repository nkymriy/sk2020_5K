require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /sessions/new" do
    it "HTTPレスポンスが200になる(画面が正常に表示される)" do
      get account_signin_path
      expect(response).to have_http_status(200)
    end
  end
end