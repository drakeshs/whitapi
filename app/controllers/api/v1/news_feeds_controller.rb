#app/controllers/api/v1/news_feeds_controller.rb
module Api
	module V1
		class NewsFeedsController < Api::ApiController
			def index
				@todays_news_feeds = NewsFeed.most_recent
				@this_weeks_news_feeds = NewsFeed.last_month
				@this_months_news_feeds = NewsFeed.last_week
			  render :json => MultiJson.dump(:status => "sucess",:todays_news_feeds => @todays_news_feeds,:this_weeks_news_feeds => @this_weeks_news_feeds,:this_months_news_feeds => @this_months_news_feeds)
			end
			def show
  			@news_feeds = NewsFeed.find(params[:id])
			  render :json => MultiJson.dump(:status => "sucess",:news_feeds => @news_feeds)
			end
		end
	end
end
