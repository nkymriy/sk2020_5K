class MemoController < ApplicationController
  def new
    @memo = Idea.new
    @user = User.find_by(id: current_user.id)
    @user_memo = @user.idea
  end

  def create
    user = User.find_by(id: current_user.id)
    # @memo.idea.new(params.permit(:idea_category_id, :idea_name, :idea_description))
    new_idea = params['idea']
    user.idea.new do |memo|

      memo.idea_category_id = 1
      memo.idea_name = new_idea[:idea_name]
      memo.idea_description = new_idea[:idea_description]
      logger.debug "params => #{new_idea}"
    end
    if user.save!
      logger.debug "save success!!"
      redirect_to idea_memo_new_path
    else
      render :new
    end
  end

  def show
    @memo = Idea.find(params[:id])
  end

  def edit
    @memo = Idea.find(params[:id])
  end

  def update
    @memo = Idea.find(params[:id])
    @memo.update(params.require(:idea).permit(:idea_name, :idea_description))
  end
end
