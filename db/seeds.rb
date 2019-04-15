# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(
    username: Faker::Name.unique.first_name,
    password: Faker::Artist.name,
    email: Faker::Internet.email
  )
end

100.times do |index|
  if index%25 == 0
    Post.create(
      title: Faker::Company.catch_phrase,
      content: Faker::Lorem.paragraph(4..8),
      user_id: rand(1..10)
    )
  else
    Post.create(
      title: Faker::TvShows::Simpsons.quote,
      url: Faker::Internet.url,
      user_id: rand(1..10)
    )
  end
end
