# == Schema Information
#
# Table name: idea_logs
#
#  id         :integer          not null, primary key
#  idea_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default(FALSE), not null
#  query      :json
#
class IdeaLog < ApplicationRecord

  QUERY_SCHEMA = {
      type: 'object',
      # nullable: true,
      properties: {
          user_id: {
              type: 'integer'
          },
          time: {
              type: 'string'
          },
          mode: {
              type: 'string'
          },
          add: {
              type: 'object',
              properties: {
                  object_id: {
                      type: 'integer'
                  },
                  content: {
                      type: 'string'
                  },
              },
          },
          delete: {
              type: 'object',
              properties: {
                  object_id: {
                      type: 'integer'
                  },
              },
          },
      },
  }.freeze

  validates :query, json: {schema: QUERY_SCHEMA}

  # validates :query, presence: true

  after_create_commit { IdealogBroadcastJob.perform_later self }
end
