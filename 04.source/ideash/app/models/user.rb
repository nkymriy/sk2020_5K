class User < ApplicationRecord
  has_one :user_logs
  has_many :user_idea
  has_many :idea, through: :user_idea
end
