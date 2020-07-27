class IdeachatController < ApplicationController
  before_action :authenticate_user!

  def index
    @ideas = Idea.all.order(:id)
  end

  def show
    # @idealogs = IdeaLog.all
    user = User.find_by(id: current_user.id)
    @idea = Idea.find(params[:id])
    @idea_logs = @idea.idea_logs.pluck("query")
    # @idea_logs = @idea.idea_logs.where(query: {mode:"add"})

    # p "@idea is #{@idea.inspect}"
    p "idea_log is #{@idea.idea_logs.inspect}"
    # p "------------------------------"

  end
end
