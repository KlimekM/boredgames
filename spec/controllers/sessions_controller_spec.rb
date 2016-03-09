require 'spec_helper'

describe SessionsController do
	let!(:user) { User.create!(first_name: "Jim", last_name: "Jones", username: "jimo", password: "password") }
	
	def create_session
		post :create, user: { username: user.username, password: user.password }
	end

	describe "GET #new" do
		it "assigns @user as a new instance of User" do
			get :new 
			expect(assigns(:user)).to be_a(User)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			it "assigns @user to the appropriate user" do
				create_session
				expect(assigns(:user).username).to eq("jimo")
			end

			it "assigns the session :user_id to the id of the current user" do
				create_session
				expect(assigns(session[:user_id])).to eq(assigns(user.id))
			end
		end
	end

end