require 'rails_helper'

RSpec.describe "top/index", type: :view do
  describe 'index.html.erbのテスト' do
    it 'h1タグ内にUsersが表示されているかどうか' do
      visit idea_history_path
      expect(page).to have_selector('h2', text: 'test')
    end
  end
end