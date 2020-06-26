class DbtestController < ApplicationController

  def index
    @users = User.all
  end

end
