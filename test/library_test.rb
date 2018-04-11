require './test/test_helper'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @dpl         = Library.new
    @charlotte   = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper      = Author.new({first_name: "Harper", last_name: "Lee"})
    @jane_eyre   = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})
    @villette    = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Villette", publication_date: "1853"})
    @mockingbird = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_has_an_empty_shelf_for_books
    assert_equal [], @dpl.books
  end
end
