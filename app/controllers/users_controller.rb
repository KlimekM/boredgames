class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(person_params)

    if @user.save
      session[:user_id] = @user.id
      render 'show'
    else
      @user
      render 'new'
    end

  end

  def show
    #user profile page
    @user = User.find(params[:id])
    if @user
      render 'show'
    else
      redirect_to '/'
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

    def person_params
      params.require(:user).permit(:first_name, :last_name, :username, :image_url, :password)
    end
end
