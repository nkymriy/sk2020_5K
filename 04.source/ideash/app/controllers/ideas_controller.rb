class IdeasController < ApplicationController
  def home
  end

  def history
    @user = User.find_by(id: current_user.id)
    @categories = IdeaCategory.all.index_by(&:id)
  end

  def category
  end
end