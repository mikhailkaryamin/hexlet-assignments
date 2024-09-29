# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  completed   :boolean
#  creator     :string
#  description :text
#  name        :string
#  performer   :string
#  status      :string           default("New")

10.times do |i|
  task_index = i + 1

  Task.create(
    completed: [true, false].sample,
    creator: Faker::Name.unique.name,
    description: Faker::Lorem.sentence,
    name: Faker::Lorem.word,
    performer: Faker::Name.unique.name,
    status: 'New'
  )
end
