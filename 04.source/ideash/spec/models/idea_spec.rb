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

RSpec.describe Idea, type: :model do
  describe 'Idea:model' do
    context 'idea' do
      #テストデータ作成(DB登録)
      #let(:idea_test){ create(:idea_test)}
      #test_idea = create(:idea_test)
      #@ideatest = create(:idea_test)

     it 'is valid' do
       #@ideatest
         #p test_idea
#       FactoryBot.lint(idea_test)
#       expect(true)
        #expect(idea_test.valid?).to eq(true)
        # 上記テストデータの場合、以下のテストはパスする
        #expect(idea_test).to be_valid
        #FactoryBot.aliases_for(:idea_name)
     end
    end
  end
end
