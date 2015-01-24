require 'rails_helper'

describe User, type: :model do
  def create_books(user)
    # 貸出中の本
    create(:user_book, user: user)

    # 返却状態の本
    create(:returned_user_book, user: user)

    # ２度目の貸出中の本
    book_id = create(:returned_user_book, user: user).book.id
    UserBook.create(user_id: user.id, book_id: book_id,
                    checkout_date: Date.current + 8.days)

    user.books
  end

  subject { build(:user) }

  it { should be_valid }
  it { should be_respond_to(:first_name) }
  it { should be_respond_to(:last_name) }
  it { should be_respond_to(:memo) }

  describe '.find_books' do
    let!(:user)  { create(:user) }
    let!(:books) { create_books(user) }

    it '適切なbooksを返却すること' do
      received_books = described_class.find_books(user.id)

      expect(received_books.count).to eq 3
    end
  end
end
