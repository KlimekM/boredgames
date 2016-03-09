class CollectionsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    user = User.find(params[:user_id])
    user.games << game
    redirect_to '/'
  end

  def destroy
    session[:return_to] ||= request.referer
    user = User.find(params[:user_id])
    game = Game.find(params[:game_id])
    collection_record = Collection.find_by(user_id: user.id, game_id: game.id)
    collection_record.destroy
    redirect_to session.delete(:return_to)
  end
end
