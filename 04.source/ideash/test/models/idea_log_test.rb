# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default(FALSE), not null
#  query      :json
#
require 'test_helper'

class IdeaLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
