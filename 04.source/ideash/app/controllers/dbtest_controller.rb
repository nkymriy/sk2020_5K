class DbtestController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :user_mail))
    if @user.save
      redirect_to :dbtest_index
    else
      render :new
    end
  end

end
