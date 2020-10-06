class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # アイデアのカテゴリーを検証し、別のカテゴリーであった場合、homeに遷移する
  def check_idea_category
    if controller_name != IdeaCategory.find(Idea.find(params[:id]).idea_category_id).manage_name
      redirect_to idea_home_path
    end
  end
end