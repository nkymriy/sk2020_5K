# == Schema Information
#
# Table name: ideas
#
#  id               :string           not null, primary key
#  idea_category_id :integer
#  idea_name        :string
#  idea_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  option           :json
#  hash_link        :string
#
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
