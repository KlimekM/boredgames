require 'spec_helper'

describe Tagging do
    let(:user) {User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
    let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}
    let(:tag) { Tag.create(name: 'good')}
    let(:tagging) { Tagging.create(tag_id: tag.id, game_id: game.id)   }

  describe 'initialize' do
    it 'has a tag' do
      expect(tagging.tag).to eq(tag)
    end

    it 'has a game' do
      expect(tagging.game).to eq(game)
    end
  end
end
