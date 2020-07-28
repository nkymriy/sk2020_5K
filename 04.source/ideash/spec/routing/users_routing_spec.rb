require 'rails_helper'

RSpec.describe "routes for Users", type: :routing do
  describe 'ルーティングのテスト' do
    it 'createアクションのルーティング' do
      expect(post("account/signin")).to route_to("users/sessions#create")
    end
  end
end