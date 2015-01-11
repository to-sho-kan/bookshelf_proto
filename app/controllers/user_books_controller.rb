class UserBooksController < ApplicationController
  def index
    status = params['status'] || 'all'

    @books = User.find_books(params['user_id'], status)
    render
  end
end
