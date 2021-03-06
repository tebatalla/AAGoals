class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @new_comment = Comment.new(commentable: @user)
    render :show
  end

  private
    def user_params
      params.require(:users).permit(:username, :password)
    end

end
