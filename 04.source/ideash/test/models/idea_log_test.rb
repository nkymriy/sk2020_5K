# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :integer
#  idea_log   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class IdeaLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
