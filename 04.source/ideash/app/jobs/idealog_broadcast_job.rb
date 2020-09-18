class IdealogBroadcastJob < ApplicationJob
  queue_as :default

  def perform(idea_log)
    # Do something later
    ActionCable.server.broadcast "idea_channel_#{idea_log.idea_id}", idea_logs: render_idealog(idea_log)

  end

  def render_idealog(idea_log)
    idea_log.query
  end
end