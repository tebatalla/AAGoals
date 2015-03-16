class GoalCommentsController < ApplicationController
  def create
    @comment = GoalComment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.goal_id = params[:goal_id]
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to @comment.goal
  end

end
