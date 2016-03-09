require 'spec_helper'

describe CommentsController do
	let!(:game) { Game.create!(name: "Monopoly", description: "Really fun", release_year: 2015) }
	let!(:comment) { Comment.create!(text: "Great game!", game_id: game.id, commenter_id: 4) }

	describe "GET #new" do
		it "assigns @comment as a new instance of Comment" do
			get "/games/:#{game.id}/comments/new"
			expect(assigns(:comment)).to be_a(Comment)
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			before :each do
      	post :create, {comment: {text: "Great game!", game_id: game.id, commenter_id: 4}}
    	end

    	it "creates a new comment" do
    		expect(assigns(:comment)).to be_a(Comment)
    	end

    	it "assigns a newly created comment as @comment" do
    		comment = Comment.last
        expect(assigns(:comment)).to eq(comment)
    	end
		end
	end

	describe "DELETE #destroy" do
		it "assigns the requested comment as @comment" do
			delete :destroy, { id: comment.id }
			expect(assigns(:comment)).to eq(comment)
		end

		it "redirects to the appropriate game" do
			redirect_to "games/#{game.id}"
		end
	end

end