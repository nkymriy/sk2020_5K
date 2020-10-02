class IdealogBroadcastJob < ApplicationJob
  queue_as :default

  def perform(json_idea_log)
    # Do something later
    ActionCable.server.broadcast "idea_channel_#{json_idea_log.idea_id}", idea_logs: get_idea_log_query(json_idea_log)
  end

  def get_idea_log_query(json_idea_log)
    json_idea_log.query
  end
end