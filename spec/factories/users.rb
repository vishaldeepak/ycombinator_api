FactoryBot.define do
  factory :user do
    username { "testUser" }
    password { "foobar" }

    factory :user_proper do
      email  { "test_user@gmail.com" }
      about { "Hello this is test user used for testing purposes" }
    end

  end
end