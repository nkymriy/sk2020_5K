class DbtestController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :user_mail))
    @user.save
  end

end
