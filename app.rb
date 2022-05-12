require './book'
require './teacher'
require './student'
require './rental'

class App
  attr_reader :books, :people, :rental

  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def run
    show_menu

    menu_list = {
      '1' => method(:book_list),
      '2' => method(:people_list),
      '3' => method(:add_teacher),
      '4' => method(:add_student),
      '5' => method(:add_book),
      '6' => method(:rent_book),
      '7' => method(:rent_history)
    }

    menu = gets.chomp
    if menu.to_i.positive? && menu.to_i <= 7
      menu_list[menu].call
    elsif menu == '0'
      puts 'Thank you for using this application.'
    else
      puts 'Invaid operation, try again.'
      run
    end
  end

  def show_menu
    puts ''
    puts 'Please select a category by typing it\'s number, then press enter.'
    puts ''
    puts '1- List of all books'
    puts '2- List of all people'
    puts '3- Add a teacher'
    puts '4- Add a student'
    puts '5- Add a book'
    puts '6- Rent a book'
    puts '7- See the rental history of a person'
    puts '0- Exit'
    puts ''
  end

  def book_list
    puts 'List of books:'
    puts ''
    @books.each_with_index do |el, i|
      puts "#{i + 1}- #{el.title} (#{el.author})"
    end
    show_link_to_main
  end

  def people_list
    puts 'List of people:'
    puts ''
    @people.each_with_index do |el, i|
      puts "#{i + 1}- #{el.name}"
    end
    show_link_to_main
  end

  def show_link_to_main
    puts ''
    puts 'Type 0 then press enter to go to the main menu. '
    key = gets.chomp
    if key == '0'
      run
    else
      puts 'Unknown command'
      show_link_to_main
    end
  end

  def add_book
    puts 'Adding a new book: '
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts ''
    puts "Book \"#{book.title}\" added successfully."

    run
  end

  def add_teacher
    puts 'Adding a new teacher: '
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts ''
    puts "Teacher \"#{teacher.name}\" added successfully."

    run
  end

  def add_student
    puts 'Adding a new student: '
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Name: '
    name = gets.chomp
    student = Student.new(age, classroom, name)
    @people.push(student)
    puts ''
    puts "Student \"#{student.name}\" added successfully."

    run
  end

  def rent_book
    puts 'select a book by typing it\'s number and press enter:'
    @books.each_with_index { |el, i| puts "#{i + 1}- #{el.title} (#{el.author})" }
    book_index = gets.chomp
    unless book_index.to_i.positive? && book_index.to_i <= @books.length
      puts 'Invalid book number, Try again.'
      rent_book
    end
    puts 'select a person by typing it\'s number and press enter:'
    @people.each_with_index { |el, i| puts "#{i + 1}- #{el.name}" }
    person_index = gets.chomp
    unless person_index.to_i.positive? && person_index.to_i <= @people.length
      puts 'Invalid person number, Try again.'
      rent_book
    end
    print 'Rent Date (yyyy/mm/dd):'
    rent_date = gets.chomp
    rental = Rental.new(rent_date, @books[book_index.to_i - 1], @people[person_index.to_i - 1])
    @rental.push(rental)
    puts 'Book rental saved successfully.'
    run
  end

  def rent_history
    puts 'select a person by typing it\'s number and press enter:'
    @people.each_with_index { |el, i| puts "#{i + 1}- #{el.name}" }
    person_index = gets.chomp
    unless person_index.to_i.positive? && person_index.to_i <= @people.length
      puts 'Invalid person number, Try again.'
      rent_book
    end

    @rental.filter do |el|
      puts "#{el.book.title} (#{el.date})" if el.person == @people[person_index.to_i - 1]
    end
  end
end
