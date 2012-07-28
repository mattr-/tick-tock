
class Flitter
  def self.timeline(user)
    begin
      twitter = Twitter::Client.new(:oauth_token => user.oauth_token,
                                    :oauth_secret => user.oauth_secret)
      twitter.home_timeline
    rescue Twitter::Error::Unauthorized
      "Not authorized to view the timeline"
    rescue Twitter::Error::BadRequest
      "Bad request sent"
      raise
    end

  end

  def self.post_tweet(user, tweet)
    begin
    twitter = Twitter::Client.new(:oauth_token => user.oauth_token,
                                  :oauth_secret => user.oauth_secret)
    twitter.update(tweet)
    rescue Twitter::Error => error
      error.to_s 
    end
  end
end
