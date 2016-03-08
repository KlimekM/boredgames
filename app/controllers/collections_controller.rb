class CollectionsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    user = User.find(params[:user_id])
    user.games << game
    redirect_to '/'
  end

  def destroy
    #delete record from user's collection
  end
end
