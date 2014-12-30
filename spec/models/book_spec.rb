require 'rails_helper'

describe Book do
  it 'タイトルと作者、出版社、発行日、状態があれば有効であること' do
    book = Fabricate(:book)
    expect(book).to be_valid
  end

  it 'タイトルがなければ無効であること' do
    book = Fabricate.build(:book, title: nil)
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end

  it '作者がなければ無効であること' do
    book = Fabricate.build(:book, author: nil)
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end

  it '出版社がなければ無効であること' do
    book = Fabricate.build(:book, publisher: nil)
    book.valid?
    expect(book.errors[:publisher]).to include("can't be blank")
  end

  it '発行日がなければ無効であること' do
    book = Fabricate.build(:book, issue_date: nil)
    book.valid?
    expect(book.errors[:issue_date]).to include("can't be blank")
  end
end
