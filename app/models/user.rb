class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def checkout_books
    return [] if books.empty?

    books_ids = user_books.where(return_date: nil).pluck(:book_id)
    Book.where('books.id in (?)', books_ids)
  end

  def returned_books
    return [] if books.empty?

    books_ids = user_books.where('return_date is not null').pluck(:book_id)
    Book.where('books.id in (?)', books_ids)
  end

  class << self
    def find_books(user_id, status = 'all')
      # uniq しないと返却〜再貸出した書籍が２重に取得されてしまうので注意！
      case status
      when 'all'
        find(user_id).books.uniq
      when 'checkout'
        find(user_id).checkout_books.uniq
      when 'returned'
        find(user_id).returned_books.uniq
      else
        []
      end
    end
  end
end
