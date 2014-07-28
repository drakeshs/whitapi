#app/controllers/api/v1/news_feeds_controller.rb
module Api
	module V1
		class NewsFeedsController < Api::ApiController
			def index
				require 'sequel'
				# Sequel::MySQL::Database 
				# @todays_news_feeds = db["SELECT * FROM news_feeds"].all
				# @todays_news_feeds = NewsFeed.all
				@todays_news_feeds = NewsFeed.most_recent
				@this_weeks_news_feeds = NewsFeed.last_month
				@this_months_news_feeds = NewsFeed.last_week
			  render :json => MultiJson.dump(:status => "sucess",:todays_news_feeds => @todays_news_feeds)
			  # render :json => MultiJson.dump(:status => "sucess",:todays_news_feeds => @todays_news_feeds,:this_weeks_news_feeds => @this_weeks_news_feeds,:this_months_news_feeds => @this_months_news_feeds)
			end
			def show
  			@news_feeds = NewsFeed.find(params[:id])
			  render :json => MultiJson.dump(:status => "sucess",:news_feeds => @news_feeds)
			end
		end
	end
end

# DB = Sequel.connect(:adapter => 'mysql2', :user => 'root', :password => "", :host => "127.0.0.1" , :database => "whitsonwatt_api_development")
