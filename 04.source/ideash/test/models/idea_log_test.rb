# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_log   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  idea_id    :integer
#
# Indexes
#
#  index_idea_logs_on_idea_id  (idea_id)
#
# Foreign Keys
#
#  idea_id  (idea_id => ideas.id)
#
require 'test_helper'

class IdeaLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
