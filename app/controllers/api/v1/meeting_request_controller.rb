module Api
	module V1
		class MeetingRequestController < Api::ApiController
		  def accountants
				@accountants = Accountant.all
				respond_to do |format|
					format.json {render :json => {:response_code => response.code, :accountants => @accountants}}
				end
			end

			def send_meeting_request
	  		ids = params[:meeting_details]["accountant_id"]
        p params[:meeting_details]
  			@meeting_request = MeetingRequest.new(params[:meeting_details])
  			@meeting_request.accountant_id = Accountant.where(name: "#{ids}").first.id
	      if @meeting_request.save! 
					render json: {status: :created}
	      else  
					render json: @meeting_request.errors, status: :unprocessable_entity
				end 
			end
			
			def feature_request
  			@feature_request = FutureRequest.new(params[:feature_request_mail])
	      if @feature_request.save!  
					render json: {status: :created}
					MeetingRequest.feature_request(@feature_request)
	      else  
					render :json => {:erors => @feature_request.errors.full_messages}, :status => 422
				end 
			end
		end
	end
end