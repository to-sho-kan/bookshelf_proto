class BooksController < ApplicationController
    def index
    @books = Book.all
    render
  end

  def show
  	@book = Book.find(params[:id])
  	render
  end
end
