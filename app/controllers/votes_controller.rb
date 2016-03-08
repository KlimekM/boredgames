class VotesController < ApplicationController
  def create
    Vote.create!(voter_id: params[:voter_id], game_id: params[:game_id], value: params[:value])
    redirect_to '/'
  end

  def destroy
    #backtrack (remove vote)
  end

  # private
  # def vote_params
  #     params.require(:vote).permit(:voter_id, :game_id, :value)
  #   end
end
