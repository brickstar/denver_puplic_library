require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte
  end

  def test_it_has_books_but_starts_empty
    assert_equal [], @charlotte.books
  end
end
