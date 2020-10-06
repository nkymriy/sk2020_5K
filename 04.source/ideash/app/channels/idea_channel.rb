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

  #TODO: 現在の内容は一時的なものなので機能しない
  def pause()
    p Time.now
    res = ActiveRecord::Base.connection.execute("select * from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'system'")
    p "-------------------#{res}---------------------"
    p "-------------------#{res[0]}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']['operation']}---------------------"
    p "-------------------#{JSON.parse(res[0]['query'])['system']['option']}---------------------"
    timer(20) do
    # timer(10 * 60) do
      ActionCable.server.broadcast "idea_channel_#{params[:idea]}", idea_logs: {'user_id': current_user.id, 'mode': 'system', 'system': {'operation': 'stop', 'option': 'sample_option'}}
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

end