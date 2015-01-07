class UsersController < ApplicationController
  def index
    @users = User.all.order("sign_in_count DESC")
  end
end
