require 'spec_helper'

describe Comment do
    let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
    let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}
    let(:comment) {Comment.create(commenter_id: user.id, game_id: game.id, text: 'hai')}

  describe 'initialize' do
    it 'has text' do
      expect(comment.text).to eq('hai')
    end

    it 'has a commenter' do
      expect(comment.commenter).to eq(user)
    end

    it 'has a game' do
      expect(comment.game).to eq(game)
    end
  end
end
