class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books

  validates :title, :author, :publisher, :issue_date, presence: true
end
