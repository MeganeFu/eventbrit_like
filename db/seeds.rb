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
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words,  encrypted_password: Faker::Creature::Animal.name, email: email)

end
p "database has now #{User.count} users"
