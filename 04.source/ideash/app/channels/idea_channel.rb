class IdeaChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # 5.times { puts '***test***' }
    stream_from "idea_channel_#{params[:idea]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'idea_channel', idea_log: data['idea_log']
    # IdeaLog.create! query: {'content': data['idea_log']}
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id,'mode': 'add', 'add': data['idea_log']}
  end

  def add(data)
    # ActionCable.server.broadcast 'idea_channel', idea_log: data['idea_log']
    # IdeaLog.create! query: {'content': data['idea_log']}
    res = ActiveRecord::Base.connection.execute("select count(*) from idea_logs where idea_id = '#{params[:idea]}' and JSON_EXTRACT(query, '$.mode') = 'add' ")
    p "-----------#{res}-----------"
    p "-----------#{res[0]}-----------"
    p "-----------#{res[0]['count(*)']}-----------"
    p "-----------#{DateTime.now}-----------"
    # TODO Timeを保存する処理を追加する
    IdeaLog.create! idea_id: params[:idea], query: {'user_id': current_user.id,'mode': 'add', 'add': { 'object_id': res[0]['count(*)'], 'content': data["content"]}, 'time': DateTime.now}
  end
end
