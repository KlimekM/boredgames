class UsersController < ApplicationController
  def new
    #form to register new user
  end

  def create
    #POST new user to database
  end

  def show
    #user profile page
    @user = User.find(params[:id])
    if @user 
      render :'/user/show'
    else
      redirect '/'
    end
  end

  def edit
    #form to edit user information
  end

  def update
    #PUT changes to user info
  end

  def destroy
    #delete user
  end
end
