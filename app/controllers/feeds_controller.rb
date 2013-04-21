class FeedsController < ApplicationController
  def index
  	@feeds = Kaminari.paginate_array(Feed.fetch_rss_feeds("http://feeds.wired.com/wired/index?format=rss")).page(params[:page]).per(10)
  end

  def display_feed_content
  	@feed = JSON.parse(params[:feed_obj])
	respond_to do |format|
		format.html  { render :partial => "feed_content" }
	end
  end
end
