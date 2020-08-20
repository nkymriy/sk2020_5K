# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default(FALSE), not null
#  query      :json

FactoryBot.define do
  factory :idea_logs do
    idea_id{1}
  end
end