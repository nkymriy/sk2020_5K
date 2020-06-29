class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:user_name, :user_mail))
    @user.save
  end
end