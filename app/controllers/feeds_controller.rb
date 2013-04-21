class FeedsController < ApplicationController

	before_filter :find_feed_entries, :only => :display_feed_content

  def index
  	@feeds = Kaminari.paginate_array(Feed.fetch_rss_feeds("http://feeds.wired.com/wired/index?format=rss")).page(params[:page]).per(10)
  end

  def display_feed_content
  	title = params[:feed_title]
  	@feed = @entries.select {|s| s.title == title}.first
		respond_to do |format|
			format.html  { render :partial => "feed_content" }
		end
  end

  def find_feed_entries
		feed = Feedzirra::Feed.fetch_and_parse("http://feeds.wired.com/wired/index?format=rss")
		@entries = feed.entries	
  end
end
