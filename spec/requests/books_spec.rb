require 'rails_helper'

RSpec.describe 'Booksリクエスト', type: :request  do
  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /books' do
    let!(:book) { create(:book) }
    let(:expected_json) do
      ['id'        => book.id,
       'title'     => book.title,
       'author'    => book.author,
       'publisher' => book.publisher,
       'issueDate' => book.issue_date,
       'status'    => book.status
      ].to_json
    end

    before(:each) do
      get '/books', {}, env
    end

    it '書籍の一覧を返却すること' do
      expect(response).to be_success
      body = response.body

      expect(body).to be_json_eql(expected_json)
    end
  end

  describe 'GET /books/:id' do
    let!(:book) { create(:book) }
    let(:expected_json) do
      { 'id'        => book.id,
        'title'     => book.title,
        'author'    => book.author,
        'publisher' => book.publisher,
        'issueDate' => book.issue_date,
        'status'    => book.status
      }.to_json
    end

    before(:each) do
      get "/books/#{book.id}", {}, env
    end

    it '書籍の一覧を返却すること' do
      expect(response).to be_success
      body = response.body

      expect(body).to be_json_eql(expected_json)
    end
  end
end
