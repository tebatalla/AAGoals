class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    username, password = params[:users][:username], params[:users][:password]
    @user = User.find_by_credentials(username, password)
    if @user
      login!(@user)
      redirect_to @user
    else
      @user = User.new(username: username)
      flash.now[:errors] = ["Invalid login"]
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

end
