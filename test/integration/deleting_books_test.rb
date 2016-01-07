require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest

  def setup
    @book = Book.create!(title: 'Pragmatic Programmer')
  end

  test 'delete books' do
    delete "/books/#{@book.id}"

    assert_response :no_content #204
  end
end
