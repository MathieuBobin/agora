class TwitterBot
  def twitter_login
    # load twitter API keys
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def tweet(tweet, handle = '')
    # Tweet somthing on Twitter
    client = twitter_login
    client.update(handle + ' ' + tweet)
  end
end