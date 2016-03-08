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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(person_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    #delete user
  end

  private
    def person_params
      params.require(:user).permit(:first_name, :last_name, :username, :image_url, :password)
    end
end
