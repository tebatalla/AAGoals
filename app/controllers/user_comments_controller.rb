class UserCommentsController < ApplicationController
  def create
    @comment = UserComment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.user_id = params[:user_id]
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to @comment.user
  end

end
