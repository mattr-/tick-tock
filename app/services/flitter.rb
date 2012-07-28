
class Flitter

  def initialize(user)
    @client = Twitter.configure do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.oauth_token = user.oauth_token
      config.oauth_token_secret = user.oauth_secret
    end
  end

  def timeline
    begin
      @client.home_timeline
    rescue Twitter::Error::Unauthorized
      "Not authorized to view the timeline"
    rescue Twitter::Error::BadRequest
      "Bad request sent"
      raise
    end

  end

  def post_tweet(tweet)
    begin
      @client.update(tweet)
    rescue Twitter::Error => error
      error.to_s 
    end
  end
end
