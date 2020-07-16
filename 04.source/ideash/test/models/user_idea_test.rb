# == Schema Information
#
# Table name: user_ideas
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  idea_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class UserIdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
