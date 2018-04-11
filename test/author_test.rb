require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte
  end

  def test_attributes
    assert_equal "Charlotte", @charlotte.first_name
    assert_equal "Bronte", @charlotte.last_name
  end

  def test_it_has_books_but_starts_empty
    assert_equal [], @charlotte.books
  end

  # def test_it_can_add_books
  #   assert_equal [], @charlotte.books
  #
  #   @charlotte.add_book("Jane Eyre", "October 16, 1847")
  #   assert_equal @charlotte.books[0].
  # end
end
