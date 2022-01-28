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

  def list_books_or_people(input)
    case input
    when 1
      list_books
    when 2
      list_people
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index { |person, i| puts "#{i}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person_or_create_book(input)
    case input
    when 3
      create_person
    when 4
      create_book
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)? [Input the number]:'
    user_option = gets.chomp

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if user_option == '1'
      print 'Has parent permission? [Y/N]'
      parent_permission = gets.chomp.downcase
      parent_permission = parent_permission == 'y'

      classroom = Classroom.new('Class A')

      new_student = Student.new(age, name, classroom, parent_permission: parent_permission)
      @people << new_student
    else
      print 'Specialization: '
      specialization = gets.chomp

      new_teacher = Teacher.new(specialization, name, age)
      @people << new_teacher
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully!'
  end

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

def main
  app = App.new

  puts 'Please choose an option by entering a number:'
  app.choices.each_with_index { |choice, index| puts "#{index + 1}. #{choice}" }

  user_choice = gets.chomp.to_i
  while user_choice != 7
    case user_choice
    when 1, 2
      app.list_books_or_people(user_choice)
    when 3, 4
      app.create_person_or_create_book(user_choice)
    when 5, 6
      app.create_or_list_rental(user_choice)
    else
      puts 'Select a valid option'
    end

    puts 'Please choose an option by entering a number:'
    app.choices.each_with_index { |choice, index| puts "#{index + 1}. #{choice}" }

    user_choice = gets.chomp.to_i
  end
end

main
