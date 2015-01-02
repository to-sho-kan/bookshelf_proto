class UserBooksController < ApplicationController
  def index
    @books = User.find(params['user_id']).books
    render
  end
end
