class CommentsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:comment][:user_id])
    @game = Game.find(params[:game_id])
    @comment = @game.comments.create(text: params[:comment][:text], commenter_id: @user.id)
    if @comment.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])
    if @comment.update(text: params[:comment][:text])
      redirect_to @game
    else 
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = @game.comments.find(params[:id])
    @comment.destroy
    redirect_to @game
  end

end
