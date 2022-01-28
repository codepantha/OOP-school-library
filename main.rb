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
end
