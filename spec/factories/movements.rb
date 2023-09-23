FactoryBot.define do
  factory :movement do
    name { 'MyString' }
    amount { 1 }
    author { association :user }
    group { association :group }
  end
end
