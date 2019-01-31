# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  city = City.create(name: Faker::GameOfThrones.city)
end

10.times do
  user = User.create(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     description: Faker::Lorem.sentence(3),
                     email: Faker::Internet.email,
                     age: Faker::Number.number(2),
                     city_id: Faker::Number.between(City.first.id, City.last.id))
end

20.times do
  gossip = Gossip.create(name: Faker::Book.title,
                         content: Faker::ChuckNorris.fact,
                         user_id: Faker::Number.between(User.first.id, User.last.id))
end

10.times do
  tag = Tag.create(title: Faker::Color.color_name)
end

Tag.all.each do |tag|
  tag.gossips << Gossip.find(rand((Gossip.first.id)..(Gossip.last.id)))
end

private_messages = PrivateMessage.create!(recipient: User.find(rand((User.first.id)..(User.last.id))),
                                          sender:User.find(rand((User.first.id)..(User.last.id))),
                                          content:Faker::Movie.quote)