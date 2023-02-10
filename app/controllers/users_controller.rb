class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @last_three_posts = @user.last_three_posts
  end
end
