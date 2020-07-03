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
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
