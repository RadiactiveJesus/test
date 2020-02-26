# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create

    @user = User.find_by(id: params[:friendship][:user_id])
    @friend = User.find_by(id: params[:friendship][:friend_id])
    User.transaction do # ensure both steps happen, or neither happen
      Friendship.create!(user: current_user, friend: @friend)
      Friendship.create!(user: friend, friend: current_user)
    end

    flash[:sucess] = 'Friend request have been sent'
    redirect_to users_index_path
  end

  def confirm
    user = User.find_by_id(params[:id])
    if current_user.confirm_friend(user)
      if requests.any?
        redirect_back(fallback_location: root_path)
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to users_path
  end

  def cancel
    @user = User.find_by(id: params[:id])
    current_user.cancel_friend_request(@user)
    flash[:success] = 'Friend Request Canceled'
    redirect_to friends_path
  end

  def ignore
    @user = User.find_by(id: params[:id])
    @friendship = Friendship.find { |f| f.user_id == @user.id }
    @friendship.destroy
    flash[:danger] = 'Friend Request Ignored'
    redirect_to friends_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
