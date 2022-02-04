require 'rspec'
require_relative '../classes/book'

describe Book do
  context 'When Testing Book class' do
    it 'Should be intialized by given author and title' do
      book = Book.new('Title', 'Author')

      title = book.title
      author = book.author
      title_author = [title, author]

      expect(title_author).to eq %w[Title Author]
    end
  end
end
