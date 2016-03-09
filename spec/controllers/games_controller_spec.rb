require 'spec_helper'

describe GamesController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:game) {Game.create!(name: 'Test Game', description: 'blahblahblah', release_year: 1984)}

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

  end

  describe 'new' do
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
      expect(response).to have_http_status(200)
    end

    it 'redirects to game path if its a different user' do

    end

  end

  #   it "creates a vote associated with a game" do
  #     create_vote(1)
  #     expect(Vote.last.game_id).to eq(game.id)
  #   end

  #   it "upvotes with value of 1" do
  #     create_vote(1)
  #     expect(Vote.last.value).to eq(1)
  #   end

  #   it "increases game's total points with upvote" do
  #     create_vote(1)
  #     expect(game.points).to eq(1)
  #   end

  #   it "downvotes with value of -1" do
  #     create_vote(-1)
  #     expect(Vote.last.value).to eq(-1)
  #   end

  #   it "decreases game's total points with downvote" do
  #     create_vote(1)
  #     create_vote(1)
  #     create_vote(1)
  #     create_vote(-1)
  #     expect(game.points).to eq(2)
  #   end

  #   it "redirects to the root page" do
  #     create_vote(1)
  #     expect(response).to redirect_to(root_path)
  #   end
  # end

  # describe "destroy" do
  #   it "deletes a vote" do
  #     create_vote(1)
  #     delete :destroy, user_id: user.id, game_id: game.id, id: Vote.last.id
  #     expect(Vote.find_by(voter_id: user.id)).to be nil
  #   end

  #   it "redirects to the root page" do
  #     create_vote(1)
  #     delete :destroy, user_id: user.id, game_id: game.id, id: Vote.last.id
  #     expect(response).to redirect_to(root_path)
  #   end
  # end

end
