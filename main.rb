# frozen_string_literal: true

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
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index { |person, i| puts "#{i}) Name: #{person.name}, ID: #{person.age}, Age: #{person.age}" }
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
end
