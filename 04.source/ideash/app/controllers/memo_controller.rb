class MemoController < ApplicationController

  def index
    # @memo = Idea.all
    @user = User.find_by(id: params[:id])
    @memo = @user.idea
  end

  def new
    @memo = Idea.new
  end

  def create
    @memo = User.find(current_user.id)
    @memo.idea.new(params.permit(:idea_category_id, :idea_name, :idea_description))
    if @memo.save
      # redirect_to :dbtest_index
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
