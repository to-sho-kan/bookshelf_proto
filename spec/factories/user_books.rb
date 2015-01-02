FactoryGirl.define do
  factory :user_book do
    association :user
    association :book

    checkout_date { Date.current }

    # 返却分データ
    factory :returned_user_book do
      return_date   { Date.current + 7.days }
    end
  end
end
