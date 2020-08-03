require 'rails_helper'

class Idea < ActiveRecord::Base
  has_many :ideas
end

RSpec.describe Idea, type: :model, class:'Idea' do
  describe 'validation' do
    context 'model idea' do
      # テストデータ作成(DB登録)
      let(:idea_test) { create(:idea_test) }

      it 'is valid' do
        # 上記テストデータの場合、以下のテストはパスする
        expect(idea_test).to be_valid
      end
    end
  end
end
