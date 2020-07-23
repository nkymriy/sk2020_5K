# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :integer
#  query      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default(FALSE), not null
#
class IdeaLog < ApplicationRecord
  validates :query, presence: true

  after_create_commit { IdealogBroadcastJob.perform_later self }
end
