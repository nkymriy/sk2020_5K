# == Schema Information
#
# Table name: ideas
#
#  id               :integer          not null, primary key
#  idea_description :string
#  idea_name        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  idea_category_id :integer
#
# Indexes
#
#  index_ideas_on_idea_category_id  (idea_category_id)
#
# Foreign Keys
#
#  idea_category_id  (idea_category_id => idea_categories.id)
#
class Idea < ApplicationRecord
  has_one :idea_logs
  has_many :user_idea
  has_many :user, through: :user_idea
end
