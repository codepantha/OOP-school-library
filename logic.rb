require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'

# App class
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @choices = [
      'List all books', 'List all people', 'Create a person', 'Create a book',
      'Create a rental', 'List all rentals for a given person id', 'Exit'
    ]
  end

  attr_reader :choices

  def create_or_list_rental(input)
    case input
    when 5
      create_rental
    when 6
      list_rentals_for_a_given_person_id
    end
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    user_book_input = gets.chomp.to_i

    book = user_book_input < @books.length ? @books[user_book_input] : ''

    puts 'Select a person from the following list by number'
    list_people
    user_person_input = gets.chomp.to_i

    if user_person_input < @people.length
      person = @people[user_person_input]
    else
      puts 'Invalid selection'
    end

    puts 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, book, person)
    @rentals.push(new_rental)
    puts 'Rental created successfully!'
  end

  def list_rentals_for_a_given_person_id
    puts 'List of persons with IDs'
    list_people
    puts 'ID of person: '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end

# CRPeople for create and list persons
class CRPeople
  def initialize
    @people = []
  end

  def list_people
    @people.each_with_index do |person, i|
      print "#{i}) "
      print person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts " Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase == 'y'

    classroom = Classroom.new('Class A')

    @people << Student.new(age, name, classroom, parent_permission: parent_permission)
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(specialization, age, name)
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]:'
    user_option = gets.chomp

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    user_option == '1' ? create_student(age, name) : create_teacher(age, name)

    puts 'Person created successfully'
  end
end

# CRBOOK for create and read from books
class CRBook
  def initialize
    @books = []
  end

  attr_accessor :books

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully!'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end
end

# Detector class indicates what action should be taken based on user input
class Detector
  def initialize
    @cr_book = CRBook.new
    @cr_people = CRPeople.new
  end

  def detect_operation(user_input)
    if user_input > 2
      user_input.odd? ? @cr_book.create_book : @cr_people.create_person
    elsif user_input.odd?
      @cr_book.list_books
    else
      @cr_people.list_people
    end
  end
end

# This class is used to display/handle menu options
class MenuOptions
  def initialize
    @choices = ['List all books', 'List all people', 'Create a book', 'Create a person',
                'Create a rental', 'List all rentals for a given person id', 'Exit']
    @detector = Detector.new
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    @choices.each_with_index { |choice, index| puts "#{index + 1}. #{choice}" }
  end

  def option_handler(user_choice)
    case user_choice
    when 1, 2, 3, 4
      @detector.detect_operation(user_choice)
    when 5, 6
      app.create_or_list_rental(user_choice)
    else
      puts 'Select a valid option'
    end
  end
end
