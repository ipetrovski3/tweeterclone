class LikesController < ApplicationController
  def save_like
    @like = Like.new(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.save

  end
end
