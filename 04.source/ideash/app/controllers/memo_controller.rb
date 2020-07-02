class MemoController < ApplicationController
  def new
    @memo = Idea.new
  end

  def create
    @memo = Idea.new(params.require(:idea).permit(:idea_category_id, :idea_name, :idea_description))
    if @memo.save
      # redirect_to :dbtest_index
    else
      render :new
    end
  end

  def show
  end

  def edit
    @memo = Idea.find(params[:id])
  end

  def update
    @memo = Idea.find(params[:id])
    @memo.update(params.require(:idea).permit(:idea_name, :idea_description))
  end
end
