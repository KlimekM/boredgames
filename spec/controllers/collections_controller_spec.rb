require 'spec_helper'

describe CollectionsController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:game) {Game.create!(name: 'Test Game', description: 'blahblahblah', release_year: 1984)}

  def add_game_to_collection
    post :create, user_id: user.id, game_id: game.id
  end

  describe "create" do

    it "adds a game to user's collection" do
      add_game_to_collection
      expect(user.games.last).to eq(game)
    end

    it "redirects to the root page" do
      add_game_to_collection
      expect(response).to redirect_to(root_path)
    end
  end

  describe "destroy" do
    it "deletes a game from a user's collection" do
      add_game_to_collection
      session[:return_to] = '/'
      delete :destroy, user_id: user.id, game_id: game.id
      expect(user.games).to_not include(game)
    end
  end

end
