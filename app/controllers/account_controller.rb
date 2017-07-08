class AccountController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @user.create_followers
  end
end
