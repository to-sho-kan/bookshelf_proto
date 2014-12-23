require 'rails_helper'

describe Book do
  it 'タイトルと作者、出版社、発行日、状態があれば有効であること' do
    book = Book.new(
             title: 'foo',
             author: 'bar',
             publisher: 'someone',
             issue_date: '2014-12-31',
             status: 1)
    expect(book).to be_valid
  end

  it 'タイトルがなければ無効であること' do
    book = Book.new(title: nil)
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end

  it '作者がなければ無効であること' do
    book = Book.new(author: nil)
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end

  it '出版社がなければ無効であること' do
    book = Book.new(publisher: nil)
    book.valid?
    expect(book.errors[:publisher]).to include("can't be blank")
  end

  it '発行日がなければ無効であること' do
    book = Book.new(issue_date: nil)
    book.valid?
    expect(book.errors[:issue_date]).to include("can't be blank")
  end

  it '状態がなければ無効であること' do
    book = Book.new(status: nil)
    book.valid?
    expect(book.errors[:status]).to include("can't be blank")
  end
end
