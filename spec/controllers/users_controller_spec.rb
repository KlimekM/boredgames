require 'spec_helper'

describe UsersController do

	describe 'user#create'do
		let(:user) {User.new(first_name: 'ray', last_name: 'curran', username: 'tyler', password: 'password')}
		let(:user) {User.new(first_name: 'curran', last_name: 'ray', username: 'tyler1', password: 'password')}
		let(:user) {User.new(first_name: 'roy', last_name: 'flop', username: 'eddie', password: 'password')}
		let(:user) {User.new(first_name: 'mike', last_name: 'klimek', username: 'glenn1', password: 'password')}
		let(:user) {User.new(first_name: 'alana', last_name: 'hanson', username: 'glenn', password: 'password')}

		context 'when password is invalid' do
			it 'renders the errors' do

				post :create, user: {username: user.username, password: 'invalid'}
				expect(response).to render_template(:'users/new')
			end
		end

		context 'when password is valid' do
			it 'creates a user and redirects to new user page' do

				post :create, user: {username: user.username, password: user.password}
				expect(response.status).to eq(200)
			end
		end
	end

	describe '#new' do
		it 'creates a new game instance' do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
	end

	describe '#search' do
    it 'finds a list of users based on a query' do
      create_game
      get :search, query: 'est'
      puts assigns(:found_games)
      expect(assigns(:found_games)).to include(assigns(:game))
    end
  end
end
