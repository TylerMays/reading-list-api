require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest

  def setup
    Book.create!(title: 'Pragmatic Programmer', rating: 5)
    Book.create!(title: "Ender's Game",         rating: 4)
  end

  test 'lisiting books' do
    get '/books'

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    assert_equal Book.count, json(response.body).size
  end

  test 'lists top rated books' do
    get '/books?rating=5'

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    assert_equal 1, json(response.body).size
  end
end
