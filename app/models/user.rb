class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :usre_books
end
