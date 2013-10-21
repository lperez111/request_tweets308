class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
      tweets = Twitter.user_timeline(self.username)
      tweets.each do |tweet|
      self.tweets << Tweet.create(text: tweet[:text])
    end
  end
end
