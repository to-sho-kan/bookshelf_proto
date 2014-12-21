require 'rails_helper'

describe 'Usersリクエスト' do
  let(:env) do
    { 'Content-Type' => 'application/json',
      'Accept'       => 'application/json' }
  end

  describe 'GET /users' do
    before(:each) do
      @user = create(:user)
      get '/users.json', {}, env
    end

    it 'ユーザの一覧を返却すること' do
      expect(response).to be_success

      pp response.body
      body = response.body

      expect(body).to have_json_path('users')
      expect(body).to have_json_size(1).at_path('users')
      expect(body).to be_json_eql({ 'users' =>
                                    [{ 'firstName' => @user.first_name,
                                       'lastName'  => @user.last_name,
                                       'createdAt' => @user.created_at,
                                       'memo'      => @user.memo }] }.to_json)
    end
  end
end
