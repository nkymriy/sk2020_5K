class DbtestController < ApplicationController

  def callertest
    @users = User.all
  end

end
