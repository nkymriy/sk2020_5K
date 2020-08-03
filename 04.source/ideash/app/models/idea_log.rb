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
      required: [
          'mode'
      ],
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
              required: [
                  'object_id',
                  'content'
              ],
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
              required: [
                  'object_id',
              ],
              properties: {
                  object_id: {
                      type: 'integer'
                  },
              },
          },
          edit: {
              type: 'object',
              required: [
                  'object_id',
                  'content'
              ],
              properties: {
                  object_id: {
                      type: 'integer'
                  },
                  content: {
                      type: 'string'
                  },
              },
          },
      },
  }.freeze

  validates :query, json: {schema: QUERY_SCHEMA}

  # validates :query, presence: true

  after_create_commit { IdealogBroadcastJob.perform_later self }
end
