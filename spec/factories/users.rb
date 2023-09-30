require 'faker'
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password { '123456' }
    password_confirmation { '123456' }
    email { Faker::Internet.email }
  end
end
