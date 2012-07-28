require_relative '../services/flitter'

class TimelineController < ApplicationController
  def index
  end

  def tweets
    @tweets = Flitter.timeline(current_user)
  end

  def post_tweet
    text = params[:tweet_text]
    Flitter.post_tweet(current_user, text)
    flash[:notice] = "Tweet posted succesfully! Better refresh!"
    redirect_to timeline_path 
  end
end
