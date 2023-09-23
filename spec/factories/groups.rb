FactoryBot.define do
  factory :group do
    name { 'MyString' }
    icon { 'MyString' }
    user { association :user }
  end
end
