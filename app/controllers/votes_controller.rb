class VotesController < ApplicationController

  def create
    Vote.create(voter_id: params[:user_id], game_id: params[:game_id], value: params[:value])
    redirect_to '/'
  end

  def destroy
    vote = Vote.find_by(:voter_id => params[:user_id], :game_id => params[:game_id])
    vote.destroy
    redirect_to '/'
  end
end

