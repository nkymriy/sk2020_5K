class IdealogBroadcastJob < ApplicationJob
  queue_as :default

  def perform(idea_log)
    # Do something later
    # ActionCable.server.broadcast 'idea_channel', idea_log: render_idealog(idea_log)
    # ActionCable.server.broadcast "idea_channel_#{idea_log.idea_id}", idealogs: render_idealog(idea_log)
    p "---------------#{idea_log.idea_id}"
    ActionCable.server.broadcast "idea_channel_#{idea_log.idea_id}", idea_logs: render_idealog(idea_log)

  end

  def render_idealog(idea_log)
    p "----------------==#{idea_log}"
    ApplicationController.renderer.render partial: 'ideachat/idealogs', locals: { idealogs: idea_log }
  end
end
