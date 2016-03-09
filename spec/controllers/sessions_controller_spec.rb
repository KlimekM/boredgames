require 'spec_helper'

describe SessionsController do
	let!(:user) { User.create!(first_name: "Jim", last_name: "Jones", username: "jimo", password: "password") }
	
	def create_session
		post :create, user: { username: user.username, password: user.password }
	end

	def create_error_session
		post :create, user: { username: user.username, password: "1234" }
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

			it "redirects to the logged in user's profile page" do
				create_session
				redirect_to user
			end
		end

		context "when valid params are passed" do
			it "assigns @user as a new instance of User" do
				create_error_session
				expect(assigns(:user)).to be_a(User)
			end


			it "assigns 'Username or password is incorrect' as @error" do
				create_error_session
				expect(assigns(:error)).to eq("Username or password is incorrect")
			end

			it "re-renders the log in page if the username or password are invalid" do
				create_error_session
				expect(response).to render_template(:new)
			end
		end
	end

	describe "GET #logout" do
		it "removes the session user_id" do
			get :logout
			expect(session[:user_id]).to be(nil)
		end

		it "redirects to the root route" do
			get :logout
			expect(response).to redirect_to "/"
		end
	end
end