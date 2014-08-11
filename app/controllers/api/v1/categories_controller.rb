#app/controllers/api/v1/categories_controller.rb
module Api
	module V1
		class CategoriesController < Api::ApiController
			def index
				@categories = Category.all
				respond_to do |format|
					format.json {render :json => {:response_code => response.code, :categories => @categories}}
				end
			end
		end
	end
end