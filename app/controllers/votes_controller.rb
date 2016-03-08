class VotesController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    user = User.find(params[:user_id])
    value = params[:value]
    Vote.create!(voter_id: user.id, game_id: game.id, value: value)
    redirect_to '/'
  end

  def destroy
    vote = Vote.find_by(:voter_id => params[:user_id], :game_id => params[:game_id])
    vote.destroy
    redirect_to '/'
    #backtrack (remove vote)
  end

  private
  def vote_params
      params.require(:vote).permit(:voter_id, :game_id, :value)
    end
end

