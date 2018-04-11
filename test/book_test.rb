require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test

  def setup
    @mockingbird = book = Book.new({author_first_name: "Harper",
                          author_last_name: "Lee",
                          title: "To Kill a Mockingbird",
                          publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Book, @mockingbird
  end

  def test_attributes
    assert_equal "Harper", @mockingbird.author_first_name
    assert_equal "Lee", @mockingbird.author_last_name
    assert_equal "To Kill a Mockingbird", @mockingbird.title
    assert_equal "1960", @mockingbird.publication_date
  end
end
