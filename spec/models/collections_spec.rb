require 'spec_helper'

describe Tagging do
    let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
    let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}
    let(:collection) { Collection.create(user_id: user.id, game_id: game.id)}

  describe 'initialize' do
    it 'has a user' do
      expect(collection.user).to eq(user)
    end

    it 'has a game' do
      expect(collection.game).to eq(game)
    end

    it 'links user to games' do
      user = User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')
      game = Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)
      collection = Collection.create(user_id: user.id, game_id: game.id)
      expect(user.games.first).to eq(game)
    end
  end
end
