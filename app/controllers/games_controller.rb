class GamesController < ApplicationController
  def index
    @popular_games = Game.popular_games.slice(0,24)
    @newest_games = Game.order(created_at: :desc).limit(24)
  end

  def new
    #form to add new game to public list
  end

  def create
    #POST new game
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    #edit game form
  end

  def update
    #PUT update to game
  end

  def destroy
    #delete game from record
  end

end
