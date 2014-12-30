Fabricator(:rental) do
  book
  user
  checkout_date Date.current
end

Fabricator(:returned_rental, from: :rental) do
  return_date Date.current
end
