# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts.reverse
  end
end
