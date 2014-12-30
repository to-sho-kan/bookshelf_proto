Fabricator(:book) do
  title      Faker::Lorem.word
  author     Faker::Lorem.word
  publisher  Faker::Lorem.word
  issue_date Time.now
end
