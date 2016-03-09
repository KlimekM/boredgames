require 'spec_helper'

describe CommentsController, type: :controller do
	let!(:user) { User.create!(first_name: "Tom", last_name: "Brady", username: "TB12", password: "iRule") }
	let!(:game) { Game.create!(name: "Monopoly", description: "Really fun", release_year: 2015) }
	let(:valid_comment_attributes) { { text: "Great game!", game_id: game.id, commenter_id: user.id } }
	let!(:comment) { game.comments.create(valid_comment_attributes) }

	def create_comment
		post :create, comment: { user_id: user.id, text: "Awesome comment",  }, game_id: game.id
	end

	def invalid_comment
		post :create, comment: { user_id: user.id, text: "",  }, game_id: game.id
	end

	def update_comment
		patch :update, game_id: game.id, id: comment.id, comment: { text: "This game is wonderful" }
	end

	def fail_to_update_comment
		patch :update, game_id: game.id, id: comment.id, comment: { text: "" }
	end

	describe "GET #new" do
		it "assigns @comment as a new instance of Comment" do
			get :new, { game_id: game.id }
			expect(assigns(:comment)).to be_a(Comment)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
   
    	it "creates a new comment" do
    		create_comment
    		expect(assigns(:game).comments.length).to be(2)
    	end

    	it "redirect to the appropriate game" do
    		create_comment
    		redirect_to game
    	end
		end

		context "when invalid params are passed" do
			it "re-renders the 'edit' template" do
        invalid_comment
        redirect_to new_game_comment_path
      end
    end
	end

	describe "GET #edit" do
		it "assigns the requested comment as @comment" do
			get :edit, { game_id: game.id, id: comment.id }
			expect(assigns(:comment)).to eq(comment)
		end
	end

	describe "PATCH #update" do
		context "when valid params are passed" do

			it "updates the comment" do
				update_comment
				expect(assigns(:comment).text).to eq("This game is wonderful")
			end

			it "redirects to the appropriate game if the attributes update" do
				update_comment
				redirect_to game
			end
		end

		context "when invalid params are passed" do
			it "re-renders the 'edit' template" do
        fail_to_update_comment
        expect(response).to render_template(:edit)
      end
		end
	end

	describe "DELETE #destroy" do
		it "assigns the requested comment as @comment" do
			delete :destroy, { game_id: game.id, id: comment.id }
			expect(assigns(:comment)).to eq(comment)
		end

		it "destroys the requested comment" do
			expect { delete :destroy, { game_id: game.id, id: comment.id }}.to change(Comment, :count).by(-1)
		end

		it "redirects to the appropriate game" do
			delete :destroy, { game_id: game.id, id: comment.id }
			redirect_to game
		end
	end
end
