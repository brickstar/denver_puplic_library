require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test

  def setup
    @charlotte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})
    @villette  = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Villette", publication_date: "1853"})
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

  def test_add_books_returns_instance_of_book
    assert_instance_of Book, @charlotte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal "Jane Eyre", @charlotte.books[0].title
    assert_equal "Charlotte", @charlotte.books[0].author_first_name
    assert_equal "Bronte", @charlotte.books[0].author_last_name
    assert_equal "1847", @charlotte.books[0].publication_date
  end

  def test_it_can_add_books
    assert_equal [], @charlotte.books

    @charlotte.add_book("Jane Eyre", "October 16, 1847")
    @charlotte.add_book("Villette", "1853")

    assert_instance_of Book, @charlotte.books[0]
    assert_equal "Jane Eyre", @charlotte.books[0].title
    assert_equal "Charlotte", @charlotte.books[0].author_first_name
    assert_equal "Bronte", @charlotte.books[0].author_last_name
    assert_equal "1847", @charlotte.books[0].publication_date

    assert_instance_of Book, @charlotte.books[1]
    assert_equal "Villette", @charlotte.books[1].title
    assert_equal "Charlotte", @charlotte.books[1].author_first_name
    assert_equal "Bronte", @charlotte.books[1].author_last_name
    assert_equal "1853", @charlotte.books[1].publication_date
  end
end
