WhitsonwattApi::Application.routes.draw do

  devise_for :users

  namespace :api , defaults: {format: 'json'} do
    namespace :v1 do
      resources :news_feeds, :only => [:index,:show] 
      resources :key_dates, :only => [:index,:show] 
      # post "meeting_request/send_email"
      get "meeting_request/accountants"
      post "meeting_request/feature_request"
      match "send_meeting_request" => "meeting_request#send_meeting_request", via: [:get, :post]
      # match "feature_request" => "meeting_request#feature_request", via: [:get, :post]
    end
  end 

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end

# sudo apt-get install build-essential

# http://localhost:3000/api/v1/meeting_request/?websiteID=4&topicID=74&groupID=7&userID=4

# http://localhost:3000/api/v1/meeting_request/?:feature_request_mail=>{&name=Rakesh&email=drakeshs@gmail.com&phone_number=9989687977&accountant_id=1&appointment_time=&purpose_of_meeting=Test meeting&skype_interview=true}

# {"player": {"name": "test","room_id": 0,"skin_id": 1,"head_id": 2,"torso_id": 3,"legs_id": 4,"x_position": 5,"y_position": 6,"direction": 7,"action": "","gender": "f"}}
# http://localhost:3000/api/v1/meeting_request/?"player": {"name": "test","room_id": 0,"skin_id": 1,"head_id": 2,"torso_id": 3,"legs_id": 4,"x_position": 5,"y_position": 6,"direction": 7,"action": "","gender": "f"}}

# http://localhost:3000/api/v1/meeting_request/?product%5Bname%5D%3DResponsive+Web+Design+with+HTML5+and+CSS3&product%5Bsku%5D%3D1849693188&product%5Bpublisher%5D%3DPackt+Publishing+%28April+10%2C+2012%29

# http://localhost:3000/api/v1/meeting_request?student={name:rakesh&age:12}

# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"feature_request_mail":{"name":"579","email":"drakesh@gmail.com","phone_number":"123456","suggestion":"Sodi meeting"}}'  http://localhost:3000/api/v1/meeting_request/feature_request

# curl -v -H "Accept: application/json" -H "Grant-type:password" -X POST -d '{"client_id":"s0m3cl13nt","client_secret": "sup3rs3cr3t","username": "rob","password":"asdfasdf"}' "http://dev.surrounds.me/oauth/token"

# "grant_type:password"

# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"feature_request_mail":{"name":"579","email":"drakesh@gmail.com","phone_number":"123456","suggestion":"Sodi meeting"}}'  http://localhost:3000/api/v1/meeting_request/feature_request

# curl -v "http://dev.surrounds.me/oauth/token" -d "grant_type=password&client_id=s0m3cl13nt&client_secret=sup3rs3cr3t&username=rob&password=asdfasdf"

# curl -u TestClient:TestSecret https://api.mysite.com/token -d 'grant_type=password&username=bshaffer&password=brent123'


 # http://192.168.3.252/api/v1/meeting_request/feature_request_mail?meeting_details[email]=drakeshs@gmail.com&meeting_details[name]=rakesh&meeting_details[phone_number]=9989687977&meeting_details[suggestion]=New York is a state in the Northeastern and Mid-Atlantic regions of the United States.&meeting_details[skype_interview]=false&meeting_details[appointment_time]=2014-07-11 08:40:00

 # /meeting_request/feature_request_mail"name=rakesh&phone_number=121321231”