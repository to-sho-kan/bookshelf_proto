require 'rails_helper'

#RSpec.describe Book, :type => :model do
#  pending "add some examples to (or delete) #{__FILE__}"
# end

describe Book do
  # タイトルと作者があれば有効であること
  it "is valid with a title and author" do
    book = Book.new(
             title: "foo",
             author: "bar" )
    expect(book).to be_valid
  end

  # タイトルがなければ無効であること
  it "is invalid without a title" do
    book = Book.new(title: nil)
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end

  # 作者がなければ無効であること
  it "is invalid without a author" do
    book = Book.new(author: nil)
    book.valid?
    expect(book.errors[:author]).to include("can't be blank")
  end
end