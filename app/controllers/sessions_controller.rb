class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
      session[:current_user_id] = user.id
      render 'users/show'
    else
      @error = "Username or password is incorrect"
      render 'sessions/new'
    end

  end

  def destroy
    session.destroy
  end

  private
     def user_params
      params.require(:user).permit(:username, :password)
    end
end
