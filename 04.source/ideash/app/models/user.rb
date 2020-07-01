class User < ApplicationRecord
  has_one :user_logs
  has_many :user_idea
  has_many :idea, through: :user_idea

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_mail,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }

end
