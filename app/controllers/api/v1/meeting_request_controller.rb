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
  			@meeting_request = MeetingRequest.new(params[:meeting_details])
  			@meeting_request.accountant_id = Accountant.where(name: "#{ids}").first.id
	      if @meeting_request.save  
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
					render json: @feature_request.errors, status: :unprocessable_entity
				end 
			end
		end
	end
end

# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"meeting_details":{"name":"579","email":"drakesh@gmail.com","phone_number":"123456","appointment_time":"July 11, 2014 08:40","purpose_of_meeting":"Sodi meeting","accountant_id": 1}}'  http://localhost:3000/api/v1/meeting_request/send_email

# curl -v -H "Content-Type: application/json" -X POST --data {"name":"579","email":"drakesh@gmail.com","phone_number":"123456","appointment_time":"July 11, 2014 08:40","purpose_of_meeting":"Sodi meeting","team_member": "Rakesh"}  http://localhost:3000/api/v1/meeting_request/send_email

# http://localhost:3000/api/v1/meeting_request?student={:name=>rakesh&:age=>12}

# {"student"=>"{name:rakesh", "age:12}"=>nil, "format"=>"json", "controller"=>"api/v1/meeting_request", "action"=>"feature_request"}

# {
#   "product": {
#     "publisher": "Packt Publishing (April 10, 2012)",
#     "name": "Responsive Web Design with HTML5 and CSS3",
#     "sku": "1849693188"
#   }

# MeetingRequest(id: integer, name: string, email: string, phone_number: integer, accountant_id: integer, appointment_time: datetime, purpose_of_meeting: text, skype_interview: boolean, created_at: datetime, updated_at: datetime)

# localhost:3000/api/v1/meeting_request/?product[name]%3DResponsive+Web+Design+with+HTML5+and+CSS3&product[sku]%3D1849693188&product[publisher]%3DPackt+Publishing+(April+10%2C+2012)

# http://192.168.3.252/api/v1/send_meeting_request?meeting_details[email]=drakeshs@gmail.com&meeting_details[name]=rakesh&meeting_details[phone_number]=9989687977&meeting_details[accountant_id]=RakeshSharma&meeting_details[purpose_of_meeting]=New York is a state in the Northeastern and Mid-Atlantic regions of the United States. New York is the 27th-most extensive, the third-most populous, and the seventh-most densely populated of the 50 United States. New York is bordered by New Jersey and Pennsylvania to the south and by Connecticut, Massachusetts, and Vermont to the east. The state has a maritime border with Rhode Island east of Long Island, as well as an international border with the Canadian provinces of Ontario to the west and north, and Quebec to the north. The state of New York is often referred to as New York State to distinguish it from New York City, its largest city.New York City, with a Census-estimated population of over 8.4 million in 2013,[8] is the most populous city in the United States and a financial, cultural, and tourism center.[9][10][11] The city alone makes up over 40 percent of the population of New York State. New York City is also known for being the location of Ellis Island, the largest gateway for immigration in the history of the United States. Both the state and city were named for the 17th century Duke of York, future King James II of England.New York was inhabited by various tribes of Algonquian and Iroquoian speaking Native Americans at the time Dutch settlers moved into the region in the early 17th century. In 1609, the region was first claimed by Henry Hudson for the Dutch. Fort Nassau was built near the site of the present-day capital of Albany in 1614. The Dutch soon also settled New Amsterdam and parts of the Hudson River Valley, establishing the colony of New Netherland. The British annexed the colony from the Dutch in 1664. The borders of the British colony, the Province of New York, were quite similar to those of the present-day state.&meeting_details[skype_interview]=false&meeting_details[appointment_time]=2014-07-11 08:40:00

# Accountant.where(name: "Rakesh").first.id
# http://192.168.3.247/api/v1/send_meeting_request?meeting_details[email]=rambabu@gmail.com&meeting_details[name]=rambabu&meeting_details[phone_number]=9989687977&meeting_details[accountant_id]=murakondarambabu&meeting_details[purpose_of_meeting]=Rakesh is good boy&meeting_details[skype_interview]=false&meeting_details[appointment_time]=2014-07-11 08:40:00
# http://192.168.3.247/api/v1/feature_request?feature_request_mail[email]=rambabu@gmail.com&feature_request_mail[name]=rakesh&feature_request_mail[phone_number]=9989687977&feature_request_mail[suggestion]=Rakesh is good boy

