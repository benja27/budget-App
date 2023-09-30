require 'faker'

FactoryBot.define do
  factory :group do
    name { faker::Name.name }
    icon { faker::Avatar.image }
    user { association :user }
  end
end
