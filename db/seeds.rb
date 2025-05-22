# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Seeding movies..."

10.times do
  Movie.create!(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraph(sentence_count: 3),
    rating: rand(6.0..9.5).round(1),
    poster_url: "https://loremflickr.com/320/480/movie,japan?lock=#{rand(1..1000)}"
  )
end

puts "Seeding lists and bookmarks..."

list = List.create!(name: "Japanese Horror Picks")

Movie.all.each do |movie|
  Bookmark.create!(
    movie: movie,
    list: list,
    comment: Faker::Quote.jack_handey
  )
end

puts "Done seeding 🎬🩸"
