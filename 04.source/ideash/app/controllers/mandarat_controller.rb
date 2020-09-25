class MandaratController < ApplicationController
  def index
  end
  def edit
    @idea = Idea.find_by(id: params[:id])
    @idea_logs = @idea.idea_logs
    @idea_users = @idea.user
  end
  def create
    p params
    user = User.find_by(id: current_user.id)
    new_idea = user.idea.new do |idea|
      idea.idea_category_id = 3
      idea.idea_name = params[:theme]
    end
    if new_idea.save!
      logger.debug "create new idea: #{new_idea.inspect}"
      redirect_to idea_mandarat_edit_url(id: new_idea.id)
    else

    end
  end
end