class BooksController < ApplicationController
  def index
    q = book_params['s']
    book = Book.search_data ("%#{q}%")
    render json: book
  end

  private
  def book_params
    params.permit(:s) 
  end

end
