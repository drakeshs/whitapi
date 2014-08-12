class FutureRequest < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :suggestion
  validates_presence_of :email,:name,:suggestion
  private 
  def self.feature_request(details)
    UserMailer.send_feature_request_mail(details).deliver
  end
end