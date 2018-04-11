require './test/test_helper'
require './lib/author'
require './lib/book'
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

  def test_it_can_add_books_to_a_collection
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert_instance_of Book, @dpl.books[0]
    assert_equal "To Kill a Mockingbird", @dpl.books[0].title
    assert_equal "Harper", @dpl.books[0].author_first_name
    assert_equal "Lee", @dpl.books[0].author_last_name
    assert_equal "1960", @dpl.books[0].publication_date

    assert_instance_of Book, @dpl.books[1]
    assert_equal "Villette", @dpl.books[1].title
    assert_equal "Charlotte", @dpl.books[1].author_first_name
    assert_equal "Bronte", @dpl.books[1].author_last_name
    assert_equal "1853", @dpl.books[1].publication_date
  end

  def test_it_can_search_for_a_book_within_collection_by_title
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_has_a_card_catalogue_array_sorted_by_author_last_name
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@jane_eyre)

    actual = @dpl.card_catalogue

    assert_instance_of Array, @dpl.card_catalogue
    assert_equal "Bronte", actual[0].author_last_name
    assert_equal "Bronte", actual[1].author_last_name
    assert_equal "Lee", actual[2].author_last_name
  end

  def test_it_can_find_all_books_by_author_first_and_last_name
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@jane_eyre)

    actual = @dpl.find_by_author("Charlotte Bronte")

    assert_instance_of Hash, actual
    assert_equal 2, actual.length
    assert_equal ["Villette", "Jane Eyre"], actual.keys
  end

  def test_it_can_find_book_by_publication_year
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    @dpl.add_to_collection(@jane_eyre)

    actual = @dpl.find_by_publication_date("1960")

    assert_instance_of Hash, actual
    assert_equal "1960", actual["To Kill a Mockingbird"].publication_date
    assert_equal "Harper", actual["To Kill a Mockingbird"].author_first_name
    assert_equal "Lee", actual["To Kill a Mockingbird"].author_last_name
  end
end
