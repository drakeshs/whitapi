class NewsFeed < ActiveRecord::Base
  attr_accessible :category_id, :news_image, :description,:news_date, :news_title,:news_image_cache
  belongs_to :category
	mount_uploader :news_image, NewsImageUploader
  p "--------------model news feeds------------------"
  p "--------------model news feeds------------------"
	p "--------------model news feeds------------------"
	p "--------------model news feeds------------------"
	# scope :most_recent, order("created_at desc").limit(4)
  # scope :order_number, ->(order_number) {where("category_id = ?","#{order_number}")} 
	scope :most_recent, ->(categories) {where("news_date = :start_date AND (category_id in (:category_id))",{:start_date => Date.today,:category_id => (categories.split(','))})} 
	scope :last_month, ->(categories) {where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month,:category_id => (categories.split(','))})} 
	scope :this_month, ->(categories)  {where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => Date.today.beginning_of_month, :end_date => Date.today,:category_id => (categories.split(','))})} 
	# scope :last_month, lambda{where("news_date >= :start_date AND news_date <= :end_date",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month})} 
	# scope :last_week, lambda{where("news_date >= :start_date AND news_date <= :end_date",{:start_date => 1.week.ago.beginning_of_week, :end_date => 1.week.ago.end_of_week})} 
end 

# class NewsFeed < Sequel::Model
#   attr_accessible :category_id, :news_image, :description,:news_date, :news_title,:news_image_cache
#   belongs_to :category
# 	mount_uploader :news_image, NewsImageUploader
# end

# NewsFeed.where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month,:category_id => (1)})


# SELECT news_title,category_id,news_date FROM `news_feeds` WHERE (news_date >= '2014-07-01 00:00:00' AND news_date <= '2014-07-31 23:59:59' AND (category_id in ('2','1')));
# NewsFeed.where("news_date >= :start_date AND news_date <= :end_date AND category_id in :category_id",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month,(:category_id => (1))})


# NewsFeed.where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month,:category_id => (1)})

# scope :current_active_leases,  -> {group("leases.id").where("leases.commencement <= ? and (leases.expiration >= ? or leases.mtm=?) and leases.is_executed= ? ", Time.now.strftime("%Y-%m-%d"), Time.now.strftime("%Y-%m-%d"), true, true) }

# "news_date >= :start_date AND news_date <= :end_date AND category_id in (?)",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month}