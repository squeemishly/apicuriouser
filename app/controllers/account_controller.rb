class AccountController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @user.create_followers
    @user.create_following
    # binding.pry
  end
end
