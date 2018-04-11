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
end
