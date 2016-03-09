require 'spec_helper'

describe UsersController do

	describe 'user#create'do 
		let(:user) {User.new(first_name: 'ray', last_name: 'curran', username: 'rpcurr', password: 'password')}

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
end