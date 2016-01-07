class BooksController < ApplicationController

  def index
    books = Book.all

    if rating = params[:rating]
      books = books.where(rating: rating)
    end
    render json: books, status: :ok
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book,        status: :created, location: book
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    render nothing: true, status: :no_content #204
  end

  def book_params
    params.require(:book).permit(:title, :rating, :author,
                                 :review, :genre_id, :amazon_id)
  end
end