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
    title "Quest #1"
    description "Description for Quest #1"
    start_date "20150801"
    end_date "20150815"
  end
end
