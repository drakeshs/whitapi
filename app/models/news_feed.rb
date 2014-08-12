class NewsFeed < ActiveRecord::Base
  attr_accessible :category_id,:category_name, :news_image, :description,:news_date, :news_title,:news_image_cache
  belongs_to :category
	mount_uploader :news_image, NewsImageUploader
	before_save { |news_feed| news_feed.category_name = news_feed.category.title }
	def self.most_recent(category)
		if category.blank? || category.split(',').include?("0")
			where("news_date = :start_date",{:start_date => Date.today})
		else 
			where("news_date = :start_date AND (category_id in (:category_id))",{:start_date => Date.today,:category_id => (category.split(','))})
		end
	end

	def self.this_month(category)
		if category.blank? || category.split(',').include?("0")
			where("news_date >= :start_date AND news_date <= :end_date",{:start_date => Date.today.beginning_of_month, :end_date => Date.today})
		else 
			where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => Date.today.beginning_of_month, :end_date => Date.today,:category_id => (category.split(','))})
		end
	end

	def self.last_month(category)
		if category.blank? || category.split(',').include?("0")
			where("news_date >= :start_date AND news_date <= :end_date",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month})
		else 
			where("news_date >= :start_date AND news_date <= :end_date AND (category_id in (:category_id))",{:start_date => 1.month.ago.beginning_of_month, :end_date => 1.month.ago.end_of_month,:category_id => (category.split(','))})
		end
	end
end 