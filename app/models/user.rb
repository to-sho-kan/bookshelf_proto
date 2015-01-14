class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def checkout_books
    return [] if books.empty?

    books_ids = user_books.where(return_date: nil).pluck(:book_id)
    Book.where(['books.id in (?)', books_ids])
  end

  def returned_books
    return [] if books.empty?

    books_ids = user_books.where('return_date is not null').pluck(:book_id)
    Book.where(['books.id in (?)', books_ids])
  end

  class << self
    def find_books(user_id, status = 'all')
      case status
      when 'all'
        find(user_id).books
      when 'checkout'
        find(user_id).checkout_books
      when 'returned'
        find(user_id).returned_books
      else
        []
      end
    end
  end
end
