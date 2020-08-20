# == Schema Information
#
# Table name: idea_categories
#
#  id                 :integer          not null, primary key
#  idea_category_name :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  manage_name        :string
#
require 'test_helper'

class IdeaCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
