class UserBooksController < ApplicationController
  def index
    status = params['status'] || 'all'

    @user_id = params['user_id']
    @books   = User.find_books(@user_id, status)

    render
  end
end
