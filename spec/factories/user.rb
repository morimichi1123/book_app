FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "User#{n}" }
      sequence(:email) { |n| "tester#{n}@example.com" }
      #email {  "tester@example.com" }

      password  { "password" }
      password_confirmation { "password" }
    end
  end
