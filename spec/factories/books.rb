FactoryGirl.define do
  factory :book do
    title      Faker::Lorem.word
    author     Faker::Lorem.word
    publisher  Faker::Lorem.word
    issue_date Time.now.strftime('%Y-%m-%d')
    status     Faker::Number.digit
  end
end
