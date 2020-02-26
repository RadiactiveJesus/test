# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all_except(current_user)
    @user = current_user
    @not_friends = @users.filter { |user| !@user.friends.include?(user) }
    @friendship = Friendship.new
  end

  def show
    @user = User.where(id: params[:id])
    @post = Post.new
    @posts = Post.where(user_id: params[:id])
  end
end
