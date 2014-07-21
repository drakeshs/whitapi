class Accountant < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :meeting_requests
end
