class UsersController < ApplicationController
  def show
    @user = current_user
    @visits = @user.visits.order(created_at: :desc)
  end
end
