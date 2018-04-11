require 'pry'
class Library
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    titles = @books.map do |book|
      book.title
    end
    titles.include?(book_title)
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end
# use author full name helper method to
#   create a hash with author full name key
#   pointing to all book objects written
#   by that author
  def find_by_author(author)
    found = {}
    @books.each do |book|
      if author == book.author_full_name
          found[book.title] = book
      end
      found
      binding.pry
    end
  end
end
