class NewsFeed < ActiveRecord::Base
  attr_accessible :category_id, :news_image, :description,:news_date, :news_title,:news_image_cache
  belongs_to :category
	mount_uploader :news_image, NewsImageUploader
	scope :most_recent, order("created_at desc").limit(4)
	scope :last_month, lambda{where("news_date >= :start_date AND news_date <= :end_date",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month})} 
	scope :last_week, lambda{where("news_date >= :start_date AND news_date <= :end_date",{:start_date => 1.week.ago.beginning_of_week, :end_date => 1.week.ago.end_of_week})} 
end
# class NewsFeed < Sequel::Model
#   attr_accessible :category_id, :news_image, :description,:news_date, :news_title,:news_image_cache
#   belongs_to :category
# 	mount_uploader :news_image, NewsImageUploader
# end
