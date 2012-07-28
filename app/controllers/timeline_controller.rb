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
    @tweets = Flitter.timeline(current_user)
    redirect_to timeline_path :notice => "Tweet posted succesfully! Better refresh!"
  end
end
