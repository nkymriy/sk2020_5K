# == Schema Information
#
# Table name: user_ideas
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  idea_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserIdea < ApplicationRecord
  belongs_to :user
  belongs_to :idea
end