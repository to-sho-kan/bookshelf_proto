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
      get '/users', {}, env
    end

    it 'ユーザの一覧を返却すること' do
      expect(response).to be_success
      body = response.body

      expect(body).to be_json_eql(expected_json)
    end
  end

  describe 'GET /users/:id' do
    let!(:user) { create(:user) }
    let(:expected_json) do
      { 'id'        => user.id,
        'firstName' => user.first_name,
        'lastName'  => user.last_name,
        'memo'      => user.memo,
        'createdAt' => user.created_at
      }.to_json
    end

    before(:each) do
      get "/users/#{user.id}", {}, env
    end

    it 'ユーザの一覧を返却すること' do
      expect(response).to be_success
      body = response.body

      expect(body).to be_json_eql(expected_json)
    end
  end

  describe 'POST /users' do
    let(:path) { '/users' }
    let(:user) { build(:user) }
    let(:receive_json) do
      { 'user' => { 'firstName' => user.first_name,
                    'lastName'  => user.last_name,
                    'memo'      => user.memo
      } }.to_json
    end

    context 'パラメータが正しいとき' do
      it '200 Created が返ってくる' do
        post path, receive_json, env
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it 'Userが1増える' do
        expect { post path, receive_json, env }.to change(User, :count).by(1)
      end

      it 'ユーザを返却すること' do
        post path, receive_json, env
        body = response.body
        response_user = User.last
        response_json = { 'id'        => response_user.id,
                          'firstName' => response_user.first_name,
                          'lastName'  => response_user.last_name,
                          'memo'      => response_user.memo,
                          'createdAt' => response_user.created_at
                        }.to_json

        expect(body).to be_json_eql(response_json)
      end
    end
  end
end
