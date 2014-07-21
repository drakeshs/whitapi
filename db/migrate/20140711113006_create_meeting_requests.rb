class CreateMeetingRequests < ActiveRecord::Migration
  def change
    create_table :meeting_requests do |t|
      t.string   :name
      t.string   :email
      t.integer  :phone_number
      t.integer  :accountant_id
      t.datetime :appointment_time
      t.text     :purpose_of_meeting
      t.boolean  :skype_interview
      t.timestamps
    end
  end
end