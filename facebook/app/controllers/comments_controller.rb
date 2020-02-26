# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      flash[:success] = 'comment posted'
    else
      flash[:warning] = 'oops!! comment could not be posted'
    end
    redirect_back fallback_location: @comment
  end

  def destroy
    @post = Post.where(id: params[:id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commentary, :user_id, :post_id)
  end
end
