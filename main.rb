require './person'
require './book'
require './rental'
require './classroom'
require './student'
require './teacher'
require './logic'

# App class
class App
  def initialize
    @people = []
    @rentals = []
    @choices = [
      'List all books', 'List all people', 'Create a book', 'Create a person',
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

def main
  menu_options = MenuOptions.new

  loop do
    menu_options.display_menu
    user_choice = gets.chomp.to_i

    menu_options.option_handler(user_choice)
    break if user_choice == 7
  end
end

main
