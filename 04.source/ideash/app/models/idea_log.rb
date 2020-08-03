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
      additionalProperties: false,
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
              type: 'string',
              enum: [
                  'add',
                  'delete',
                  'edit',
                  'grouping',
                  'group',
                  'chat'
              ]
          },
          add: {
              type: 'object',
              additionalProperties: false,
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
              additionalProperties: false,
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
              additionalProperties: false,
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
          grouping: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'object_id',
                  'group_id'
              ],
              properties: {
                  object_id: {
                      type: 'integer'
                  },
                  group_id: {
                      type: 'integer'
                  },
              },
          },
          group: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'group_id',
                  'name'
              ],
              properties: {
                  group_id: {
                      type: 'integer'
                  },
                  name: {
                      type: 'string'
                  },
              },
          },
          chat: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'content'
              ],
              properties: {
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
