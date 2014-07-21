# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'creating news feeds'
50.times do 
	num = [1,2,3,4,5].sample
  NewsFeed.create(:category_id => num,news_image:"",:news_title => "Election Commissioner",:description => "India is a rails123ist Secular Democratic Republic and the largest democracy in the World The modern Indian nation state came into existence on 15th of August 1947 Since then free and fair elections have been held at regular intervals as per the principal",:news_date => Date.today)
end
puts 'created news feeds'

puts 'creating users'
puts 'creating user1'
user = User.create! :email => 'cc@innovahub.com', :password => 'rails123', :password_confirmation => 'rails123'
puts 'New user1 created: ' << user.email

puts 'creating user2'
user = User.create! :email => 'test@test.com', :password => 'rails123', :password_confirmation => 'rails123'
puts 'New user2 created: ' << user.email

puts 'created users'