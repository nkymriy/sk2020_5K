class IdeaChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # 5.times { puts '***test***' }
    stream_from "idea_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'idea_channel', idea_log: data['idea_log']
    IdeaLog.create! query: {'content': data['idea_log']}
  end
end
