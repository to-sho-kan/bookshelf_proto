require 'rails_helper'

RSpec.describe 'UserBooksリクエスト', type: :request  do
  def create_books(user)
    [].tap do |books|
      books << create(:user_book, user: user).book
      books << create(:returned_user_book, user: user).book
      books << create(:user_book, user: user).book
    end
  end

  def books_to_received_json(books)
    books.map do |book|
      book.as_json(except: [:updated_at, :created_at]).transform_keys! { |k| k.camelize(:lower) }
    end.to_json
  end

  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /users/:id/books' do
    let!(:user)  { create(:user) }
    let!(:books) { create_books(user) }
    let!(:expected_books) { books_to_received_json(books) }

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
      let!(:expected_books) { books_to_received_json(checkout_books) }

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
      let!(:expected_books) { books_to_received_json(returned_books) }

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
