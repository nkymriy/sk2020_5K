class IdeachatController < ApplicationController
  before_action :authenticate_user!

  def index
    @ideas = Idea.all.order(:id)
  end

  def show
    # @idealogs = IdeaLog.all
    @idea = Idea.find(params[:id])
    @idea_logs = @idea.idea_logs
  end
end
