require 'rails_helper'

RSpec.describe 'UserBooksリクエスト', type: :request  do
  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /users/:id/books' do
    let(:user)  { create(:user_with_checkout_book) }
    let(:book)  { user.books.first }
    let(:expected_books) do
      [
        { 'id'        => book.id,
          'title'     => book.title,
          'author'    => book.author,
          'publisher' => book.publisher,
          'issueDate' => book.issue_date,
          'status'    => book.status
        }
      ].to_json
    end

    before(:each) do
      get "users/#{user.id}/books", nil, env
    end

    it ':idで指定したユーザの関係している書籍一覧を返却すること' do
      expect(response).to be_success

      body = response.body
      expect(body).to be_json_eql(expected_books)
    end
  end
end
