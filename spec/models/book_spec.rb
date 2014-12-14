require 'rails_helper'

describe Book do
  it 'タイトルと作者があれば有効であること' do
    book = Book.new(
             title: 'foo',
             author: 'bar')
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
end
