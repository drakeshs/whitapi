class CreateMeetingRequests < ActiveRecord::Migration
  def change
    create_table :meeting_requests do |t|
      t.string   :name
      t.string   :email
      t.string  :phone_number, :limit => 10
      t.integer  :accountant_id
      t.datetime :appointment_time
      t.text     :purpose_of_meeting
      t.boolean  :skype_interview, default: 0
      t.timestamps
    end
  end
end