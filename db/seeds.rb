# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'


Faker::Config.locale = :fr

p "#####################################"
p "DESTROY ALL"

User.destroy_all
p "USER DESTROY"

5.times do |index|
	  email = "email_#{index}@yopmail.com"
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, password: Faker::Cannabis.cannabinoid, email: email)

end
p "database has now #{User.count} users"


p "EVENT DeSTROY"

5.times do 
	Event.create!(start_date: Faker::Date.between(from: Date.today, to: 2.year.from_now), duration: Faker::Number.within(range: 15...120), title: Faker::Space.planet + " " + "festival", description: Faker::TvShows::TwinPeaks.quote, price: Faker::Number.within(range: 1..200), location: Faker::Address.city, user_id: User.all.sample.id)
	
end 
p "database has now #{Event.count} events"
	
	