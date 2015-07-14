require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name "Bob"
    last_name "Schlob"
  end

  factory :quest do
    title { Faker::Lorem.words(4).join(" ").titleize }
    description { Faker::Lorem.sentence }
    start_date { Date.today }
    end_date { Faker::Date.forward(10) }
  end
end
