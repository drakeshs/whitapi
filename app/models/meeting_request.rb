class MeetingRequest < ActiveRecord::Base
  attr_accessible :appointment_time, :email, :name, :phone_number, :purpose_of_meeting,:accountant_id,:accountant, :skype_interview
	belongs_to :accountant
  after_create :send_meeting_request_email

  private
  def send_meeting_request_email
    # unless self.email.include?('@example.com') && Rails.env != 'test'
      UserMailer.meeting_requester(self).deliver
      UserMailer.meeting_request_to(self).deliver
    # end
  end
  def self.feature_request(details)
    UserMailer.send_feature_request_mail(details).deliver
  end
end