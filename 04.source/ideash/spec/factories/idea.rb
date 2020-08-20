# Table name: ideas
#
#  id               :integer          not null, primary key
#  idea_category_id :integer
#  idea_name        :string
#  idea_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  option           :json
#  hash_link        :string


# FactoryBot.define do
#   factory :idea_test,class: Idea do
#     idea_category_id{1}
#     idea_name{"test"}
#     idea_description{"example_idea"}
#   end
# end
