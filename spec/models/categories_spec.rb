require 'spec_helper'

describe Tag do
    let(:user) {User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
    let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}
    let(:category) { Category.create(name: 'good')}
    let(:categorization) { Categorization.create(category_id: category.id, game_id: game.id)   }

  describe 'initialize' do

    it 'has a categorization' do
      user = User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')
      game = Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)
      category = Category.create(name: 'good')
      categorization = Categorization.create(category_id: category.id, game_id: game.id)
      expect(category.categorizations.first).to eq(categorization)
    end

    it 'has a game' do
      user = User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')
      game = Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)
      category = Category.create(name: 'good')
      tagging = Categorization.create(category_id: category.id, game_id: game.id)
      expect(category.games.first).to eq(game)
    end
  end
end
