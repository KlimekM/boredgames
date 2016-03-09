require 'spec_helper'

describe CommentsController, type: :controller do
	let!(:user) { User.create!(first_name: "Tom", last_name: "Brady", username: "TB12", password: "iRule") }
	let!(:game) { Game.create!(name: "Monopoly", description: "Really fun", release_year: 2015) }
	let(:valid_comment_attributes) { { text: "Great game!", game_id: game.id, commenter_id: user.id } }
	let!(:comment) { game.comments.create(valid_comment_attributes) }

	describe "GET #new" do #working
		it "assigns @comment as a new instance of Comment" do
			get :new, { game_id: game.id }
			expect(assigns(:comment)).to be_a(Comment)
		end
	end

	describe "POST #create" do #not working
		context "when valid params are passed" do
			before :each do
      	post :create, { user_id: user.id, game_id: game.id, comment: { text: "Awesome game!", game_id: game.id, commenter_id: user.id }}
    	end
   
    	it "creates a new comment" do
    		expect(assigns(:comment)).to be_a(Comment)
    	end

    	it "assigns a newly created comment as @comment" do
    		comment = Comment.last
        expect(assigns(:comment)).to eq(comment)
    	end

    	it "redirect to the appropriate game" do
    		redirect_to "games/#{game.id}"
    	end
		end

		context "when invalid params are passed" do
			it "re-renders the 'edit' template" do
        post(:create, { user_id: user.id, game_id: game.id, comment: { text: "Great game!", game_id: game.id, commenter_id: user.id }})
        expect(response).to render_template(:edit)
      end
		end
	end

	describe "GET #edit" do #working
		it "assigns the requested comment as @comment" do
			get :edit, { game_id: game.id, id: comment.id }
			expect(assigns(:comment)).to eq(comment)
		end
	end

	describe "PATCH #update" do #not working
		context "when valid params are passed" do
			before :each do 
				patch :update, game_id: game.id, id: comment.id
			end

			it "updates the comment" do
				patch :update, :comment => { :text => "My favorite game!" }
				expect(comment.text).to eq("My favorite game!")
			end

			it "redirects to the appropriate game if the attributes update" do
				redirect_to "games/#{game.id}"
			end
		end

		context "when invalid params are passed" do
			it "re-renders the 'edit' template" do
        patch(:update, { game_id: game.id, comment: { text: "Great game!", game_id: game.id }})
        expect(response).to render_template(:edit)
      end
		end
	end

	describe "DELETE #destroy" do #working
		it "assigns the requested comment as @comment" do
			delete :destroy, { game_id: game.id, id: comment.id }
			expect(assigns(:comment)).to eq(comment)
		end

		it "destroys the requested comment" do
			expect { delete :destroy, { game_id: game.id, id: comment.id }}.to change(Comment, :count).by(-1)
		end

		it "redirects to the appropriate game" do
			redirect_to "games/#{game.id}"
		end
	end
end
