class MemoController < ApplicationController
  layout 'head_left_layout'
  def new
    get_user_memos
    @memo = Idea.new
    @info_message = params[:info_message]
  end

  def create
    user = User.find_by(id: current_user.id)
    new_idea = params[Settings.request_param_string[:idea]]
    user.idea.new do |memo|
      memo.idea_category_id = 1
      memo.idea_name = new_idea[:idea_name]
      memo.idea_description = new_idea[:idea_description]
      logger.debug "params => #{new_idea}"
    end
    if user.save!
      redirect_to idea_memo_new_path(info_message: "success")
    else
      redirect_to idea_memo_new_path(info_message: "fail")
    end
  end

  def show
    check_idea_category
    @memo = Idea.find(params[:id])
  end

  def edit
    check_idea_category
    get_user_memos
    @memo = Idea.find(params[:id])
    if @memo.user.ids[0] != current_user.id
      redirect_to idea_memo_new_path
    end
  end

  def update
    check_idea_category
    @memo = Idea.find(params[:id])
    if @memo.user.ids[0] != current_user.id
      redirect_to idea_memo_new_path
    end
    @memo.update(params.require(:idea).permit(:idea_name, :idea_description))
    redirect_to idea_memo_new_path(info_message: "update")
  end

  protected

  def get_user_memos
    user = User.find_by(id: current_user.id)
    @user_memo = user.idea
  end
end