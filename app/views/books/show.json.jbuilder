json.key_format! camelize: :lower
json.extract! @book, :id, :title, :author, :publisher, :issue_date
