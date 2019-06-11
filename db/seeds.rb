# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#10.times do
  #User.create!(
    #email: Faker::Internet.email,
  #  password: "test33"
#  )
#end


#puts 'Users created '
10.times do
  Brand.create!(
    email: Faker::Internet.email,
    password: "test33",
    company_name: Faker::Coffee.blend_name
  )
end

puts '10 brands created'


10.times do
  Product.create!(
    title: Faker::Creature::Cat.name + " " + Faker::Creature::Cat.name,
    description: "lorem ipsum",
    price: rand(0..100).to_f,
    brand_id: Brand.all.sample.id
  )
end

puts '10 products created'
