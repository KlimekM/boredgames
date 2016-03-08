class VotesController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    user = User.find(params[:user_id])
    value = params[:value]
    Vote.create!(voter_id: user.id, game_id: game.id, value: value)
    redirect_to '/'
  end

  def destroy
    #backtrack (remove vote)
  end

  private
  def vote_params
      params.require(:vote).permit(:voter_id, :game_id, :value)
    end
end
