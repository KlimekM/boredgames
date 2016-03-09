
require 'spec_helper'


describe Vote do
  let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
  let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}
  let(:vote1) {Vote.create(voter_id: user.id, game_id: game.id, value: 1) }
  let(:vote2) {Vote.create(voter_id: user.id, game_id: game.id, value: 1 )}

  describe 'initialize' do
    it 'has a user' do
      expect(vote1.voter).to eq(user)
    end

    it 'has a game' do
      expect(vote1.game).to eq(game)
    end

    it 'has a value' do
      expect(vote1.value).to eq(1)
    end
  end
end
