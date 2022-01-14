# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Product.destroy_all
Review.destroy_all
User.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Games::Minecraft.item, cost: Faker::Number.within(range: 1..1000), country_of_origin: Faker::Games::LeagueOfLegends.location)
  5.times do |index|
    Review.create!(author: Faker::JapaneseMedia::OnePiece.character, content_body: Faker::Lorem.sentence(word_count: 20), rating: Faker::Number.within(range: 1..5), product_id: product.id)
  end
end

user = User.new
user.email = "user@epicodus.com"
user.password = "epicodus"
user.password_confirmation = "epicodus"
user.save!

admin = User.new
admin.email = "admin@epicodus.com"
admin.password = "epicodus"
admin.password_confirmation = "epicodus"
admin.admin = true
admin.save!

p "Created #{Product.count} products!"
p "Created #{Review.count} reviews!"
p "Created #{User.count} users!"