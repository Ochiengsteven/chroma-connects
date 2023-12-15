class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    puts "DEBUG: @user is #{@user.inspect}"
  end
end
