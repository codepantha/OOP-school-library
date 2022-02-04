require 'rspec'
require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/student'

describe Rental do
  before(:each) do
    book = Book.new('The autobiography of Amr', 'Amr Ahmed')
    person = Student.new(23, 'Zoro')
    @rental = Rental.new('02/10/1997', book, person)
  end

  context 'When testing Rental' do
    it 'should initialize correctly' do
      rental_details = [@rental.date, @rental.book.title, @rental.person.name]
      expect(rental_details).to eq ['02/10/1997', 'The autobiography of Amr', 'Zoro']
    end
  end
end
