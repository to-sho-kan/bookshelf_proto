json.key_format! camelize: :lower
json.array! @books, :id, :title, :author, :publisher, :issue_date
