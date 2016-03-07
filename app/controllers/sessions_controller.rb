class SessionsController < ApplicationController
  def new
    #form to log in
  end

  def create

    session[:current_user_id] = @user.id
  end

  def destroy
    #log out
  end
end
