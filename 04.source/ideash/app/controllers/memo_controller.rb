class MemoController < ApplicationController
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
  end

  def edit
  end
end
