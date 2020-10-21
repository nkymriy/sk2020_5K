class IdeaChannel < ApplicationCable::Channel
  def subscribed
    stream_from "idea_channel_#{params[:idea]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'idea_channel', idea_log: data['idea_log']
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'add', 'add': data['idea_log']}
  end

  def add(data)
    res = ActiveRecord::Base.connection.execute("select count(*) from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'add' ")
    # TODO Timeを保存する処理を追加する
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'add', 'add': {'object_id': res[0]['count(*)'], 'content': data["content"]}, 'time': DateTime.now}
    # TODO グループIDの初期値は後々話し合う
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'grouping', 'grouping': {'object_id': res[0]['count(*)'], 'group_id': 0}}
  end

  def join_user()
    res = ActiveRecord::Base.connection.execute("select count(*) from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'join' and JSON_EXTRACT(query, '$.user_id') = #{current_user.id}")
    if res[0]['count(*)'] > 0
      return
    end
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'join', 'join': {'user_mail': current_user.email}}
  end

  def chat_send(data)
    if (current_user.user_name != nil)
      IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'chat', 'chat': {'user_name': current_user.user_name, 'content': data['content']}}
    else
      # NOTE: ユーザ名が設定されていない場合Anonymousで登録する
      IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'chat', 'chat': {'user_name': 'Anonymous', 'content': data['content']}}
    end
  end

  def pause()
    p Time.now
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system' limit 4")
    p "-------------------#{res}---------------------"
    p "-------------------#{res[0]}---------------------"
    p "-------------------#{res[1]}---------------------"
    p "-------------------#{res[2]}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']['operation']}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']['option']}---------------------"
    p "-------------------#{res[3].class}---------------------"

    # TODO: ループを利用したコードへの短縮が可能に見えるので、余裕ができたら短縮を試みる
    if (res[3].nil?)
      IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'system', 'system': {'operation': 'start', 'option': 'sample_option'}}
      # NOTE: プロセス1,2,3における時間を設定する
      process1 = {'id' => res[0]['id'], 'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}
      process2 = {'id' => res[1]['id'], 'time' => JSON.parse(res[1]['query'])['system']['option'].to_i}
      process3 = {'id' => res[2]['id'], 'time' => JSON.parse(res[2]['query'])['system']['option'].to_i}

      # プロセス1の処理
      timer(process1['time']) do
        idea_log = IdeaLog.find_by(id: process1['id'])
        idea_log.update(is_active: 1)
        ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'stop', 'option': 'process1'}}
      end
      # プロセス2の処理
      timer(process2['time']) do
        idea_log = IdeaLog.find_by(id: process2['id'])
        idea_log.update(is_active: 1)
        ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'stop', 'option': 'process2'}}
      end
      # プロセス3の処理
      timer(process3['time']) do
        idea_log = IdeaLog.find_by(id: process3['id'])
        idea_log.update(is_active: 1)
        ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'stop', 'option': 'process3'}}
      end

    end
  end

  def timer(arg, &proc)
    x = case arg
        when Numeric then
          arg
        when Time then
          arg - Time.now
        when String then
          Time.parse(arg) - Time.now
        else
          raise
        end

    sleep x if block_given?
    yield
  end

  def group_add()
    res = ActiveRecord::Base.connection.execute("select count(*) from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'group' ")
    group_id = res[0]['count(*)'] + 1
    group_name = 'グループ' + group_id.to_s
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'group', 'group': {'group_id': group_id, 'name': group_name}}
  end

  def group_rename(data)
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'group'")
    data = data['content']
    group_id = data['group_id'].to_i
    group_name = data['name']
    res_id = group_id - 1
    if IdeaLog.find(res[res_id]['id']).update! query: {'user_id': current_user.id, 'mode': 'group', 'group': {'group_id': group_id, 'name': group_name}}
      ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'group_rename', 'option': {'group_id': group_id, 'name': group_name}}}
    end
  end

  def grouping(data)
    data = data['content']
    object_id = data['object_id'].to_i
    group_id = data['group_id'].to_i
    content = data['content']
    add_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'add'")
    grouping_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'grouping'")
    # p "---------------#{data}---------------------"
    # p "---------------#{object_id}--------------------"
    # p "---------------#{group_id}---------------------"
    # p "---------------#{add_res[0]['query']['add']}---------------------"
    # p "---------------#{JSON.parse(add_res[0]['query'])['add']}---------------------"
    # p "---------------#{add_res.select { |hoge| JSON.parse(hoge['query'])['add']['object_id'] === object_id }}-------------"
    # p "---------------#{add_res.select { |hoge| JSON.parse(hoge['query'])['add']['object_id'] === object_id }[0]['id']}-------------"
    # p "---------------#{grouping_res.select { |hoge| JSON.parse(hoge['query'])['grouping']['object_id'] === object_id }.last['id']}-------------"
    # p "---------------#{request}-------------"

    grouping_id = grouping_res.select { |hoge| JSON.parse(hoge['query'])['grouping']['object_id'] === object_id }[0]['id']
    if IdeaLog.find(grouping_id).update! query: {'user_id': current_user.id, 'mode': 'grouping', 'grouping': {'object_id': object_id, 'group_id': group_id}}
      ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'grouping', 'option': {'content':content ,'object_id': object_id ,'group_id': group_id}}}
    end
  end
end