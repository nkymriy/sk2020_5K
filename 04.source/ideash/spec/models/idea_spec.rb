# == Schema Information
#
# Table name: ideas
#
#  id               :integer          not null, primary key
#  idea_category_id :integer
#  idea_name        :string
#  idea_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  option           :json
#  hash_link        :string
#
require 'rails_helper'

 # class Idea < ActiveRecord::Base
 #   has_many dependent: :destroy
 # end

RSpec.describe Idea, type: :model, class:Idea do
  describe 'validation' do
    context 'model idea' do
      # テストデータ作成(DB登録)
      # let(:idea_test) { create(:idea_test) }

      it 'is valid' do
        #FactoryBot.lint(idea_test)
        # expect(idea_test.valid?).to eq(true)
        # 上記テストデータの場合、以下のテストはパスする
        #expect(idea_test).to be_valid
        FactoryBot.aliases_for(:idea_name)
      end
    end
  end
end
