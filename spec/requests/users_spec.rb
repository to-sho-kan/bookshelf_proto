require 'rails_helper'

RSpec.describe 'Usersリクエスト', type: :request  do
  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /users' do
    let!(:user) { create(:user) }
    let(:expected_json) do
      ['id'        => user.id,
       'firstName' => user.first_name,
       'lastName'  => user.last_name,
       'memo'      => user.memo,
       'createdAt' => user.created_at
      ].to_json
    end

    before(:each) do
      get '/users.json', {}, env
    end

    it 'ユーザの一覧を返却すること' do
      expect(response).to be_success
      body = response.body

      expect(body).to be_json_eql(expected_json)
    end
  end
end
