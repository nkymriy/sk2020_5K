class IdeachatController < ApplicationController
  before_action :authenticate_user!

  def show
    @idealogs = IdeaLog.all
  end
end
