class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(person_params)

    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render 'show'
  end

  def show
    #user profile page
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
      params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end
