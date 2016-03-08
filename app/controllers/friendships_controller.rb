class FriendshipsController < ApplicationController
  def create
    current_user = User.find(params[:current_user])
    @user = User.find(params[:id])
    current_user.friends << @user
    @user.friends << current_user
    redirect_to user_path(@user)
  end

  def destroy
    #friend breakup
    friend = User.find(params[:friend])
    current_user = User.find(params[:id])
    friend.friends.delete(current_user)
    current_user.friends.delete(friend)
    redirect_to user_path(current_user)
  end
end
