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
    quote = Faker::Games::Overwatch.quote
    while(quote.length < 7 ) do
      quote = Faker::Games::Overwatch.quote
    end
    Post.create!(
      title: quote,
      content: Faker::Lorem.paragraph(4..8),
      user_id: rand(1..10)
    )
  else
    quote = Faker::TvShows::Simpsons.quote
    while(quote.length < 7 ) do
      quote = Faker::TvShows::Simpsons.quote
    end

    post = Post.create!(
      title: quote,
      url: Faker::Internet.url,
      user_id: rand(1..10)
    )

  end
end

100.times do |index|
  user = User.find(rand(1..10))
  post = Post.find(rand(50..100))
  post.upvote_by user
end
