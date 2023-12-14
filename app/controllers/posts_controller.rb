class PostsController < ApplicationController
  def index; end

  before_action :set_user, only: [:show]

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def set_user
    @user = User.find_by(name: params[:name])
    return if @user

    redirect_to root_path, alert: 'User not found'
  end
end
