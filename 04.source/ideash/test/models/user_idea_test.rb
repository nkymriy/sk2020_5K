# == Schema Information
#
# Table name: user_ideas
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  idea_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_user_ideas_on_idea_id  (idea_id)
#  index_user_ideas_on_user_id  (user_id)
#
# Foreign Keys
#
#  idea_id  (idea_id => ideas.id)
#  user_id  (user_id => users.id)
#
require 'test_helper'

class UserIdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
