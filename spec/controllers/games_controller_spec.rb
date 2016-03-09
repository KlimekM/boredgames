require 'spec_helper'

describe GamesController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:usertwo) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:game) {Game.create!(name: 'Test Game', description: 'blahblahblah', release_year: 1984, creator_id: user.id)}

  # def create_vote(value)
  #   post :create, user_id: user.id, game_id: game.id, value: value
  # end


  def create_game
    session[:user_id] = user.id
    post :create, game: { name: 'Test Game', description: 'blahblahblah', release_year: 1984 }
  end

  describe "create" do

    it "creates a game" do
      create_game
      expect(assigns(:game)).to be_a(Game)
    end

    it 'renders the new template again if the game is not created' do
      session[:user_id] = user.id
      post :create, game: { name: 'Test Game', release_year: 1984 }
      expect(response).to render_template(:new)
    end

  end

  describe '#new' do
    it 'creates a new game instance' do
      session[:user_id] = user.id
      get :new
      expect(assigns(:game)).to be_a(Game)
    end

    it 'redirects back to sessions new if not logged in' do
      get :new
      expect(response).to redirect_to('/sessions/new')
    end
  end

  describe 'edit' do
    it 'assigns game as a game instance' do
      session[:user_id] = user.id
      get :edit, id: game.id
      expect(assigns(:game)).to be_a(Game)
    end

    it 'renders the edit page for the user' do
      session[:user_id] = user.id
      get :edit, id: game.id
      expect(response).to render_template(:edit)
    end

    it 'redirects to game path if its a different user' do
      session[:user_id] = usertwo.id
      get :edit, id: game.id
      expect(response).to redirect_to(game)
    end

  end

  describe '#show' do
    it 'assigns game to the right game' do
      get :show, id: game.id
    end
  end

  describe '#update' do
    it 'assigns game to the right game' do
      session[:user_id] = user.id
      put :update, id: game.id, game: {name: 'Test Game', description: 'blahblahblah', release_year: 1984, creator_id: user.id}
      expect(assigns(:game)).to eq(game)
    end

    it 'updates attributes when something changes' do
      session[:user_id] = user.id
      put :update, id: game.id, game: {name: 'Fun Game', description: 'blahblahblah', release_year: 1984, creator_id: user.id}
      expect(assigns(:game).name).to eq('Fun Game')
    end

    it 'renders the show page when the user is authorized' do
      session[:user_id] = user.id
      put :update, id: game.id, game: {name: 'Test Game', description: 'blahblahblah', release_year: 1984, creator_id: user.id}
      expect(response).to render_template(:show)
    end

    it 'renders the edit page again when the user is authorized' do
      session[:user_id] = usertwo.id
      put :update, id: game.id, game: {name: 'Test Game', description: 'blahblahblah', release_year: 1984, creator_id: user.id}
      expect(response).to render_template(:edit)
    end
  end

  describe '#search' do
    it 'finds a list of games based on a query' do
      create_game
      get :search, query: 'est'
      puts assigns(:found_games)
      expect(assigns(:found_games)).to include(assigns(:game))
    end
  end


end
