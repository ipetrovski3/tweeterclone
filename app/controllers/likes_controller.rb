class LikesController < ApplicationController
  def like
    @tweet = Tweet.find(params[:tweet_id])
    redirect_to @tweet if @tweet.likes.where(user_id: current_user.id).first_or_create
  end

  def unlike
    @tweet = Tweet.find(params[:tweet_id])
    redirect_to @tweet if @tweet.likes.where(user_id: current_user.id).destroy_all
  end
end
