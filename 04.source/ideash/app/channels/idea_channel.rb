class IdeaChannel < ApplicationCable::Channel
  def subscribed
    stream_from "idea_channel_#{params[:idea]}"
    process_times = get_process_time
    target_times = subscribed_target_time
    ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'get_process_time', "process_times": process_times}}
    ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {"mode":"settime","settime":{"target_times": target_times}}
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
    if (current_user.user_name != nil)
      IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'join', 'join': {'user_name': current_user.user_name}}
    else
      # NOTE: ユーザ名が設定されていない場合Anonymousで登録する
      IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'join', 'join': {'user_name': 'Anonymous'}}
    end
  end

  def editing(data)
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'editing', 'editing': {'object_id': data["object_id"], 'is_editing': 1}, 'time': DateTime.now}
  end

  def edit(data)
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'edit', 'edit': {'object_id': data["object_id"], 'content': data["content"]}, 'time': DateTime.now}
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
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system' limit 5")
    idea_category_id = Idea.find(params[:idea]).idea_category_id
    # TODO: ループを利用したコードへの短縮が可能に見えるので、余裕ができたら短縮を試みる
    # NOTE: ブレインストーミングの場合
    if (idea_category_id === 2)
      if (res[4].nil?)
        IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'system', 'system': {'operation': 'start', 'option': 'sample_option'}}
        # NOTE: プロセス1,2,3における時間を設定する
        process1 = {'id' => res[0]['id'], 'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}
        process2 = {'id' => res[1]['id'], 'time' => JSON.parse(res[1]['query'])['system']['option'].to_i}
        process3 = {'id' => res[2]['id'], 'time' => JSON.parse(res[2]['query'])['system']['option'].to_i}

        if process1['time'] == 0 || process2['time'] == 0 || process3['time'] == 0
          return
        end

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

    elsif (idea_category_id === 3)
      if (res[1].nil?)
        IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'system', 'system': {'operation': 'start', 'option': 'sample_option'}}
        process1 = {'id' => res[0]['id'], 'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}

        if process1['time'] == 0
          return
        end

        # プロセス1の処理
        timer(process1['time']) do
          idea_log = IdeaLog.find_by(id: process1['id'])
          idea_log.update(is_active: 1)
          ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'stop', 'option': 'process1'}}
        end
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
    group_name = 'グループ' + res[0]['count(*)'].to_s
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'group', 'group': {'group_id': group_id, 'name': group_name}}
  end

  def group_rename(data)
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'group'")
    data = data['content']
    group_id = data['group_id'].to_i
    group_name = data['name']
    if IdeaLog.find(res[group_id]['id']).update! query: {'user_id': current_user.id, 'mode': 'group', 'group': {'group_id': group_id, 'name': group_name}}
      ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'group_rename', 'option': {'group_id': group_id, 'name': group_name}}}
    end
  end

  def grouping(data)
    data = data['content']
    object_id = data['object_id'].to_i
    group_id = data['group_id'].to_i
    content = data['content']
    grouping_res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'grouping'")
    grouping_id = grouping_res.select { |hoge| JSON.parse(hoge['query'])['grouping']['object_id'] === object_id }[0]['id']
    if IdeaLog.find(grouping_id).update! query: {'user_id': current_user.id, 'mode': 'grouping', 'grouping': {'object_id': object_id, 'group_id': group_id}}
      ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'mode': 'system', 'system': {'operation': 'grouping', 'option': {'content': content, 'object_id': object_id, 'group_id': group_id}}}
    end
  end

  def get_process_time()
    idea_category_id = Idea.find(params[:idea]).idea_category_id
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system' limit 3")
    if (idea_category_id === 2)
      process1 = {'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}
      process2 = {'time' => JSON.parse(res[1]['query'])['system']['option'].to_i}
      process3 = {'time' => JSON.parse(res[2]['query'])['system']['option'].to_i}
      return [process1,process2,process3]
    elsif (idea_category_id === 3)
      process1 = {'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}
      return [process1]
    end
  end

  def subscribed_target_time

    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system' limit 4")

    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id, 'mode': 'system', 'system': {'operation': 'start', 'option': 'sample_option'}}
    # NOTE: プロセス1,2,3における時間を設定する
    process1 = {'id' => res[0]['id'], 'time' => JSON.parse(res[0]['query'])['system']['option'].to_i}
    process2 = {'id' => res[1]['id'], 'time' => JSON.parse(res[1]['query'])['system']['option'].to_i}
    process3 = {'id' => res[2]['id'], 'time' => JSON.parse(res[2]['query'])['system']['option'].to_i}

    create_process = ActiveRecord::Base.connection.execute("select time(created_at) from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system' limit 1")
    ##本番環境では分を足す　*60
    process1_min = process1['time']
    process2_min = process2['time']
    process3_min = process3['time']
    create_process_conversion = Time.parse(res[0]['created_at'])
    target_time1 = create_process_conversion + process1_min
    target_time2 = create_process_conversion + process1_min + process2_min
    target_time3 = create_process_conversion + process1_min + process2_min + process3_min
    return [target_time1, target_time2, target_time3]
  end

end