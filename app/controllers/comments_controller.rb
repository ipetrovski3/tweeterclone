class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])

    @comment = tweet.comments.build(comment_params)

    @comment.save
    redirect_to tweet
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to comment.tweet
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
