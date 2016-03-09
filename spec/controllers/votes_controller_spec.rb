require 'spec_helper'

describe VotesController do

  let(:user) {User.create!(first_name: 'John', last_name: "Doe", username: "john123", password: 'password ' )}
  let(:game) {Game.create!(name: 'Test Game', description: 'blahblahblah', release_year: 1984)}

  def create_vote(value)
    post :create, user_id: user.id, game_id: game.id, value: value
  end

  describe "create" do

    it "creates a vote associated with a user" do
      create_vote(1)
      expect(Vote.last.voter_id).to eq(user.id)
    end

    it "creates a vote associated with a game" do
      create_vote(1)
      expect(Vote.last.game_id).to eq(game.id)
    end

    it "upvotes with value of 1" do
      create_vote(1)
      expect(Vote.last.value).to eq(1)
    end

    it "upvotes with value of 1" do
      create_vote(-1)
      expect(Vote.last.value).to eq(-1)
    end

    it "redirects to the root page" do
      create_vote(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "destroy" do
    it "deletes a vote" do
      create_vote(1)
      delete :destroy, user_id: user.id, game_id: game.id, id: Vote.last.id
      expect(Vote.find_by(voter_id: user.id)).to be nil
    end

    it "redirects to the root page" do
      create_vote(1)
      delete :destroy, user_id: user.id, game_id: game.id, id: Vote.last.id
      expect(response).to redirect_to(root_path)
    end
  end

end
