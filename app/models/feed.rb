class Feed < ActiveRecord::Base
  attr_accessible :author, :content, :published, :summary, :title, :url


  class << self

  	def fetch_rss_feeds(feed_url)
  		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
  		feed.entries
  	end
  end
end
