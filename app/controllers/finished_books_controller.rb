class FinishedBooksController < ApplicationController
  def index
    books = Book.finished

    respond_to do |format|
      format.json { render json: books, status: :ok }
      format.xml  { render xml:  books, status: :ok }
    end
  end
end