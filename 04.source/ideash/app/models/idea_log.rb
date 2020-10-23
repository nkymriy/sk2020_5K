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
  # NOTE timeにValidateがかかっていないので、必要があれば以下に記述する
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
                  'chat',
                  'join',
                  'editing',
                  'system'
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
                  'user_name',
                  'content'
              ],
              properties: {
                  user_name: {
                      type: 'string'
                  },
                  content: {
                      type: 'string'
                  },
              },
          },
          join: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'user_mail'
              ],
              properties: {
                  user_mail: {
                      type: 'string'
                  },
              },
          },
          editing: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'object_id',
                  'is_editing'
              ],
              properties: {
                  object_id: {
                      type: 'integer'
                  },
                  is_editing: {
                      type: 'integer'
                  },
              },
          },
          system: {
              type: 'object',
              additionalProperties: false,
              required: [
                  'operation',
                  'option'
              ],
              properties: {
                  operation: {
                      type: 'string'
                  },
                  option: {
                      type: 'string'
                  },
              },
          },
      },
  }.freeze

  validates :query, json: {schema: QUERY_SCHEMA}
  after_create_commit { IdealogBroadcastJob.perform_later self }

  def self.get_group_object_id(idea_id)
    add_contents = {}
    group_contents = {}
    grouping_contents = {}
    add_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{idea_id}' and JSON_EXTRACT(query, '$.mode') = 'add'")
    group_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{idea_id}' and JSON_EXTRACT(query, '$.mode') = 'group'")
    grouping_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{idea_id}' and JSON_EXTRACT(query, '$.mode') = 'grouping'")

    add_res.select do |a_res|
      add_contents.merge!(JSON.parse(a_res['query'])['add']['object_id'] => JSON.parse(a_res['query'])['add']['content'])
    end

    group_res.select do |g_res|
      group_contents.merge!(JSON.parse(g_res['query'])['group']['group_id'] => JSON.parse(g_res['query'])['group']['name'])
      grouping_contents.store(JSON.parse(g_res['query'])['group']['group_id'], {})
      grouping_contents[JSON.parse(g_res['query'])['group']['group_id']].store('name', group_contents[JSON.parse(g_res['query'])['group']['group_id']])
      grouping_contents[JSON.parse(g_res['query'])['group']['group_id']].store('objects', {})
    end

    grouping_res.select do |g_res|
      grouping_contents[JSON.parse(g_res['query'])['grouping']['group_id']]['objects'].store(JSON.parse(g_res['query'])['grouping']['object_id'], add_contents[JSON.parse(g_res['query'])['grouping']['object_id']])
    end

    return grouping_contents

    # NOTE: grouping_contentの形式
    # grouping_content = {
    #     group_id: {
    #         'name': 'hoge',
    #         'objects': {
    #             object_id: 'content',
    #             object_id: 'content',
    #             object_id: 'content',
    #         },
    #     },
    # }
  end
end