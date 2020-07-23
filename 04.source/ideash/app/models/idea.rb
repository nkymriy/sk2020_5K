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
class Idea < ApplicationRecord
  has_many :idea_logs
  has_many :user_idea
  has_many :user, through: :user_idea
end
