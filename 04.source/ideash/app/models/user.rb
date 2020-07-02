# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_mail  :string           not null
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_user_mail  (user_mail) UNIQUE
#
class User < ApplicationRecord
  has_one :user_logs
  has_many :user_idea
  has_many :idea, through: :user_idea
end
