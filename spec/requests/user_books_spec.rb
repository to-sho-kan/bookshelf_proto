require 'rails_helper'

RSpec.describe 'UserBooksリクエスト', type: :request  do
  def create_books(user)
    # 貸出中の本
    create(:user_book, user: user)

    # 返却状態の本
    create(:returned_user_book, user: user)

    # ２度目の貸出中の本
    book_id = create(:user_book, user: user).book.id
    UserBook.create(user_id: user.id, book_id: book_id,
                    checkout_date: Date.current + 8.days)

    user.books
  end

  # books情報を元に以下のようなjsonオブジェクトを生成すること
  # [
  #  {
  #    "id": 123,
  #    "title": "Book Title",
  #    "author": "someone",
  #    "publisher": "somepublisher",
  #    "rentals": [
  #      {
  #        "checkoutDate": "2015-01-01",
  #        "returnDate": "",
  #      },
  #      {
  #        "checkoutDate": "2015-01-01",
  #        "returnDate": "",
  #      }
  #    ]
  #  },
  #
  #  //...同じようなハッシュ
  # }
  def received_user_books_json(user_id, books)
    books.map do |book|
      book_hash = book.as_json(except: [:updated_at, :created_at])
                      .transform_keys! { |k| k.camelize(:lower) }

      book_hash['rentals'] = book.user_books.where(user_id: user_id).map do |user_book|
        user_book.as_json(only: [:checkout_date, :return_date])
                 .transform_keys! { |k| k.camelize(:lower) }
      end

      book_hash
    end.to_json
  end

  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /users/:id/books' do
    let!(:user)  { create(:user) }
    let!(:books) { create_books(user) }
    let!(:expected_books) { received_user_books_json(user.id, books) }

    context 'status未指定のケース' do
      before(:each) do
        get "users/#{user.id}/books", nil, env
      end

      it ':idで指定されたユーザに関連する全書籍を返却すること' do
        expect(response).to be_success

        received_books = JSON.parse(response.body)
        expect(body).to be_json_eql(expected_books)

        expect(received_books.count).to eq books.size
      end
    end

    context 'status: allのケース' do
      before(:each) do
        get "users/#{user.id}/books", { status: :all }, env
      end

      it ':idで指定されたユーザに関連する全書籍を返却すること' do
        expect(response).to be_success

        received_books = JSON.parse(response.body)
        expect(body).to be_json_eql(expected_books)

        expect(received_books.count).to eq books.size
      end
    end

    context 'status: checkoutのケース' do
      let!(:checkout_books) { User.find(user.id).checkout_books }
      let!(:expected_books) { received_user_books_json(user.id, checkout_books) }

      before(:each) do
        get "users/#{user.id}/books", { status: :checkout }, env
      end

      it ':idで指定されたユーザに関連する書籍で貸出中の書籍を返却すること' do
        expect(response).to be_success

        received_books = JSON.parse(response.body)
        expect(body).to be_json_eql(expected_books)

        expect(received_books.count).to eq checkout_books.size
        expect(received_books.count).to eq 2 # <= 念のため
      end
    end

    context 'status: returnedのケース' do
      let!(:returned_books) { User.find(user.id).returned_books }
      let!(:expected_books) { received_user_books_json(user.id, returned_books) }

      before(:each) do
        get "users/#{user.id}/books", { status: :returned }, env
      end

      it ':idで指定されたユーザに関連する書籍で返却済みの書籍を返却すること' do
        expect(response).to be_success

        received_books = JSON.parse(response.body)
        expect(body).to be_json_eql(expected_books)

        expect(received_books.count).to eq returned_books.size
        expect(received_books.count).to eq 1 # <= 念のため
      end
    end
  end
end
