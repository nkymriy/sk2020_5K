# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  user_name              :string
#  email                  :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    describe 'validation' do
      context 'correct params' do
        # テストデータ作成(DB登録)
        let(:user) { create(:user) }
        it 'is valid' do
          # 上記テストデータの場合、以下のテストはパスする
          expect(user).to be_valid
        end
      end
    end
  end
end