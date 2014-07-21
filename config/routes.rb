WhitsonwattApi::Application.routes.draw do

  devise_for :users

  namespace :api , defaults: {format: 'json'} do
    namespace :v1 do
      resources :news_feeds, :only => [:index,:show] 
      resources :key_dates, :only => [:index,:show] 
      # post "meeting_request/send_email"
      get "meeting_request/accountants"
      # post "meeting_request/feature_request"
      match "send_meeting_request" => "meeting_request#send_meeting_request", via: [:get, :post]
      match "feature_request" => "meeting_request#feature_request", via: [:get, :post]
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
