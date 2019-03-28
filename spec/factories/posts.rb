FactoryBot.define do
  factory :post do
    user
    title {"test post"}

    factory :post_proper do
      url  { "www.google.com" }
      content { "Hello this is a test post used for testing purposes" }
    end

  end
end