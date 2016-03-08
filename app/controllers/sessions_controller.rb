class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      render 'users/show'
    else
      @user = User.new
      @error = "Username or password is incorrect"
      render 'sessions/new'
    end

  end

  def logout
    reset_session
    redirect_to '/'
  end

  private
     def user_params
      params.require(:user).permit(:username, :password)
    end
end
