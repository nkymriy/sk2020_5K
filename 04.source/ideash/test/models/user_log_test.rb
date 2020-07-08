# == Schema Information
#
# Table name: user_logs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_user_logs_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'test_helper'

class UserLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
