require_relative '../services/flitter'

class TimelineController < ApplicationController
  def index
  end

  def tweets
    client = Flitter.new(current_user)
    @tweets = client.timeline
  end

  def post_tweet
    client = Flitter.new(current_user)

    text = params[:tweet_text]
    client.post_tweet(current_user, text)

    flash[:notice] = "Tweet posted succesfully!"
    redirect_to timeline_path 
  end
end
