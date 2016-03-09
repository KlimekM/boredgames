require 'spec_helper'

describe UsersController do

	let(:user) {User.create(first_name: 'ray', last_name: 'curran', username: 'tyler', password: 'password')}
		let(:user1) {User.create(first_name: 'curran', last_name: 'ray', username: 'alana', password: 'password')}
		let(:user2) {User.create(first_name: 'roy', last_name: 'alana', username: 'eddie', password: 'password')}
		let(:user3) {User.create(first_name: 'mike', last_name: 'klimek', username: 'glenn1', password: 'password')}
		let(:user4) {User.create(first_name: 'alana', last_name: 'hanson', username: 'glenn', password: 'password')}

		def create_some_users
			user = User.create(first_name: 'ray', last_name: 'curran', username: 'tyler', password: 'password')
			user1 = User.create(first_name: 'curran', last_name: 'ray', username: 'alana', password: 'password')
			user2 = User.create(first_name: 'roy', last_name: 'alana', username: 'eddie', password: 'password')
			user3 = User.create(first_name: 'mike', last_name: 'klimek', username: 'glenn1', password: 'password')
			user4 = User.create(first_name: 'alana', last_name: 'hanson', username: 'glenn', password: 'password')
		end

	describe 'user#create'do

		# these seem to be for sessions
		# context 'when password is invalid' do
		# 	it 'renders the errors' do

		# 		post :create, user: {username: user.username, password: 'invalid'}
		# 		expect(response).to render_template(:'users/new')
		# 	end
		# end

		# context 'when password is valid' do
		# 	it 'creates a user and redirects to new user page' do

		# 		post :create, user: {username: user.username, password: user.password}
		# 		expect(response.status).to eq(200)
		# 	end
		# end

		it 'assigns a user to the correct user' do
			post :create, user: {first_name: 'Tyler', last_name: 'Mac', username: 'tyler', password: 'password'}
			expect(assigns(:user)).to be_a(User)
		end

		it 'renders new again if th user does not provide information' do
			post :create, user: {username: user.username, password: user.password}
			expect(response).to render_template(:new)
		end


	end

	describe '#new' do
		it 'creates a new game instance' do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
	end

	describe '#search' do
    it 'finds a list of users based on a query with first name matching' do
    	create_some_users
      get :search, query: 'lana'
      firstname = User.find_by_first_name('alana')
      expect(assigns(:found_users)).to include(firstname)
    end

    it 'finds a list of users based on a query with last name matching' do
    	create_some_users
      get :search, query: 'lana'
      lastname = User.find_by_last_name('alana')
      expect(assigns(:found_users)).to include(lastname)
    end

    it 'finds a list of users based on a query with username matching' do
    	create_some_users
      get :search, query: 'lana'
      username = User.find_by_username('alana')
      expect(assigns(:found_users)).to include(username)
    end
  end

end
