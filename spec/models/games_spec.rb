require 'spec_helper'


describe Game do
  let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password', image_url: 'http://www.google.com')}
  let(:game) {Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)}



  describe 'initialize' do
    it 'has a name' do
      expect(game.name).to eq('Checkers')
    end

    it 'has a release year' do
      expect(game.release_year).to eq(1988)
    end

    it 'has a player range' do
      expect(game.player_range).to eq('1-4')
    end

    it 'has a publisher' do
      expect(game.publisher).to eq('Harvey')
    end

   it 'has a play time' do
      expect(game.play_time).to eq('45 minutes')
    end

    it 'has a description' do
      expect(game.description).to eq('real good')
    end

    it 'has a creator' do
      expect(game.creator).to eq(user)
    end

    it 'game to have a certain number of points based on votes' do
      vote1 = Vote.create(voter_id: user.id, game_id: game.id, value: 1 )
      vote2 = Vote.create(voter_id: user.id, game_id: game.id, value: 1 )
      expect(game.points).to eq(2)
    end

    it 'sorts popular games ahead of unpopular ones' do
      game2 = Game.create(name: 'Chess', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: 3)
      game = Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)
      vote1 = Vote.create(voter_id: user.id, game_id: game.id, value: 1 )
      vote2 = Vote.create(voter_id: user.id, game_id: game.id, value: 1 )
      expect(Game.popular_games.first).to eq (game)
    end

    it 'sorts popular games ahead of unpopular ones' do
      game2 = Game.create(name: 'Chess', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: 3)
      game = Game.create(name: 'Checkers', release_year: 1988, player_range: '1-4', publisher: 'Harvey', play_time: '45 minutes', description: 'real good', creator_id: user.id)
      expect(Game.newest_games.first).to eq (game)
    end
  end
end
