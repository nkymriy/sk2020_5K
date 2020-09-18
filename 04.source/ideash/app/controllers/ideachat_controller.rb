class IdeachatController < ApplicationController
  before_action :authenticate_user!

  def index
    @ideas = Idea.all.order(:id)
  end

  def show
    user = User.find_by(id: current_user.id)
    @idea = Idea.find(params[:id])
    @idea_logs = @idea.idea_logs.pluck("query")
  end
end