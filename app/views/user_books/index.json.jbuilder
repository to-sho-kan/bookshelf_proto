json.key_format! camelize: :lower
json.array! @books do |book|
  json.(book, :id, :title, :author, :publisher, :issue_date)
  json.rentals book.user_books.where(@user_id), :checkout_date, :return_date
end
