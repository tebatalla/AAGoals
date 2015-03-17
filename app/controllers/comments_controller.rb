class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    flash[:errors] = comment.errors.full_messages unless comment.save
    redirect_to comment.commentable
  end

  private

  def comment_params
    params.require(:comments).permit(:content, :commentable_type, :commentable_id)
  end
end
