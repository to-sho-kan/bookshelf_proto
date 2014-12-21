class UsersController < ApplicationController
  def index
    users = User.all.each.map do |user|
      { 'firstName' => user.first_name,
        'lastName'  => user.last_name,
        'createdAt' => user.created_at,
        'memo'      => user.memo }
    end

    render json: { users: users }.to_json
  end
end
