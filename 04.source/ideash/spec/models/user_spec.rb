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

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# describe "hogehoge" do
#   it "1 + 1は2になること" do
#     expect(1 + 1).to eq 2
#   end
# end

RSpec.describe User, type: :model do
  describe 'Userモデルのバリデーションテスト' do
    it "emailの値があれば有効" do
      user = User.new(
          email: "sample@example.com"
      )
      expect(user).to be_valid
    end
  end
end