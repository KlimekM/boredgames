class FriendshipsController < ApplicationController
  def create
    current_user = User.find(params[:current_user])
    @user = User.find(params[:id])
    current_user.friends << @user
    @user.friends << current_user
    if request.xhr?
      render partial: '/users/friends_list', layout: false, locals: {user: @user}
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    #friend breakup
    friend = User.find(params[:friend])
    current_user = User.find(params[:id])
    friend.friends.delete(current_user)
    current_user.friends.delete(friend)
    if request.xhr?
      render partial: '/users/friends_list', layout: false, locals: {user: current_user}
    else
      redirect_to user_path(current_user)
    end
  end
end
