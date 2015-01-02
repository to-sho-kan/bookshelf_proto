FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    memo       Faker::Lorem.sentence

    # 本を借りた状態
    factory :user_with_checkout_book do
      after(:build) do |user|
        book = FactoryGirl.create(:book)
        FactoryGirl.create(:user_book, book: book, user: user)
      end
    end

    # 本を返却した状態
    factory :user_with_return_book do
      after(:build) do |user|
        book = FactoryGirl.create(:book)
        FactoryGirl.create(:returned_user_book, book: book, user: user)
      end
    end
  end
end
