class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rental_history.push(self)
    @person = person
    person.rental_history.push(self)
  end
end
