class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, :through => :usre_books

  validates :title, :author, :publisher, :issue_date, :status, presence: true
end
