# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# t.string "title"
# t.text "body"
# t.string "summary"
# t.boolean "published"

10.times do |i|
  post_index = i + 1

  Post.create(
    title: Faker::Company.name,
    body: Faker::Lorem.paragraph(sentence_count: 4),
    summary: Faker::Lorem.sentence,
    published: [true, false].sample
  )
end
