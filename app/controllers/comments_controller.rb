class CommentsController < ApplicationController

  def new
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user

     if @comment.save
       redirect_to @tweet
     else
       render :new
     end
  end

  def destroy
    session_notice(:danger, 'You must be logged in!') unless logged_in?
    
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to comment.tweet
  end

  def edit
    session_notice(:danger, 'You must be logged in!') unless logged_in?

    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet
  end

  def update
    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet

    if @comment.update(comment_params)
      redirect_to @tweet
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
