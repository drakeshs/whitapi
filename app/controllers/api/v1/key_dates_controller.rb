#app/controllers/api/v1/key_dates_controller.rb
module Api
	module V1
		class KeyDatesController < Api::ApiController
			def index
				@key_dates = KeyDate.all
				respond_to do |format|
					format.json {render :json => {:response_code => response.code, :key_dates => @key_dates}}
				end
			end
			def show
  			@key_dates = KeyDate.find(params[:id])
				respond_to do |format|
					format.json {render :json => {:response_code => response.code, :key_dates => @key_dates}}
				end
			end
		end
	end
end