class UserMailer < ActionMailer::Base
  default :from => "Whistonwhatt.com <railstest39@gmail.com>"

  def meeting_requester(invitation)
    @invitation = invitation
 	  @accountant_email = Accountant.find(invitation.accountant_id).email
		Time.zone = 'Brisbane' 
		time = invitation.appointment_time.to_s 
		@appointment_time = Time.zone.parse(time) 
    mail(:to => invitation.email, :subject => "Hello '#{@invitation.name}' you've scheduled a meeting with '#{@accountant_email}'")
  end

  def meeting_request_to(invitation)
    @invitation = invitation
 	  @accountant_email = Accountant.find(invitation.accountant_id)
		Time.zone = 'Brisbane' 
		time = invitation.appointment_time.to_s 
		@appointment_time = Time.zone.parse(time) 
    mail(:to => @accountant_email.email, :subject => "You've been invited to join Meeting with '#{@invitation.name}'")
  end

  def send_feature_request_mail(feature_request)
    @suggester_name = feature_request.name
    @suggester_email = feature_request.email
    @suggester_suggestion = feature_request.suggestion
    @suggester_phone_number = feature_request.phone_number
    mail(:to => 'railstest39@gmail.com', :subject => "A new suggestion from '#{@suggester_name}'")
  end
end