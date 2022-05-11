require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental_history

  def initialize(age, name = 'Unknown', parent_permission = nil)
    super()
    @age = age
    @name = name
    parent_permission = true if parent_permission.nil?
    @parent_permission = parent_permission
    @rental_history = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def rent(date, book)
    return if @rental_history.length.positive? && @rental_history[@rental_history.length - 1].person == self

    Rental.new(date, book, self)
  end
end
