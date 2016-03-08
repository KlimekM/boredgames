class GamesController < ApplicationController
  def index
    @popular_games = Game.popular_games.slice(0,24)
    @newest_games = Game.order(created_at: :desc).limit(24)
  end

  def new
    @game = Game.new
    if logged_in?
      @game = Game.new
      render 'new'
    else
      # flash warning that user must be logged in to create a game?
      redirect_to '/sessions/new'
    end
  end

  def create
    @game = Game.new(game_params)
    @game.creator_id = current_user.id

    if @game.save
      render 'show'
    else
      render 'new'
    end
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

  def search
    @found_games = Game.where('name LIKE ?', "%#{params[:query]}%").all
    puts @found_games
  end

  private
    def game_params
      params.require(:game).permit(:name, :release_year, :player_range,
        :image_url, :publisher, :play_time, :description, :tag_ids => [], :category_ids => [])
    end

    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user != nil
    end

end
