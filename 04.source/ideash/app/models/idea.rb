class Idea < ApplicationRecord
  has_one :idea_logs
  has_many :user_idea
  has_many :user, through: :user_idea
end
