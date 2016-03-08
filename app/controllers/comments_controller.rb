class CommentsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:comment][:user_id])
    @game = Game.find(params[:game_id])
    @game.comments.create(text: params[:comment][:text], commenter_id: params[:comment][:user_id])
    redirect_to @game
  end

  def edit
    #edit comment
  end

  def update
    #PUT request
  end

  def destroy
    #delete comment
  end

end
