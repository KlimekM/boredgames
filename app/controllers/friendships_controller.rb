class FriendshipsController < ApplicationController
  def create
    current_user = User.find(params[:current_user])
    @user = User.find(params[:id])
    current_user.friends << @user
    redirect_to user_path(@user)
  end

  def destroy
    #friend breakup
    current_user = User.find(params[:id])
    current_user.friends.delete(params[:friend])
    redirect_to user_path(current_user.id)
  end
end
