Fabricator(:user) do
  first_name Faker::Name.first_name
  last_name  Faker::Name.last_name
  memo       Faker::Lorem.sentence
end
