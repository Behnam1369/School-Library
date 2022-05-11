class Book
  attr_reader :rental_history
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental_history = []
  end

  def rent(date, person)
    return if @rental_history[@rental_history.length - 1].book == self

    Rental.new(date, self, person)
  end
end
