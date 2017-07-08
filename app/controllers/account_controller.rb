class AccountController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @user.prep_user
  end
end
