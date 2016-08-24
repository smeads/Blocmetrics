# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "helloworld",
    confirmed_at: "2016-08-4 18:00:00"
  )
end
users = User.all

# creates registered applications
20.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

100.times do
  Event.create!(
    name: Faker::Lorem.word,
    registered_application: registered_applications.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
