# AppDataIO class persists and fetches the data
class AppDataIO
  def initialize(cr_book = {}, cr_people = {}, cr_rentals = {})
    @book_arr = []
    @people_arr = []
    @rentals_arr = []
    @cr_book = cr_book
    @cr_people = cr_people
    @cr_rentals = cr_rentals
  end

  def save_data
    save_book
    save_people
    save_rentals
  end

  def read_books
    books = []
    return [] unless File.exist?('./data/books.json')

    book_arr = JSON.parse(File.read('./data/books.json'))
    book_arr.each { |book_item| books << Book.new(book_item['title'], book_item['author']) }
    books
  end

  def create_student_or_teacher(person)
    if person['specialization']
      Teacher.new(person['specialization'], person['name'],
                  person['age'], person['id'])
    else
      Student.new(person['age'], person['name'], person['classroom'],
                  person['id'], parent_permission: person['parent_permission'])
    end
  end

  def read_people
    people = []
    return [] unless File.exist?('./data/people.json')

    people_arr = JSON.parse(File.read('./data/people.json'))
    people_arr.each do |person|
      people << create_student_or_teacher(person)
    end
    people
  end

  def read_rentals
    rentals = []
    return [] unless File.exist?('./data/rentals.json')

    rentals_arr = JSON.parse(File.read('./data/rentals.json'))
    rentals_arr.each do |rental|
      book, person = rental.values_at('book', 'person')

      rentals << Rental.new(rental['date'], Book.new(book['title'], book['author']),
                            create_student_or_teacher(person))
    end
    rentals
  end

  private

  def save_book
    @cr_book.books.each { |book| @book_arr << { 'title' => book.title, 'author' => book.author } }
    File.write('./data/books.json', JSON.dump(@book_arr))
  end

  def save_people
    @cr_people.people.each do |person|
      person.is_a?(Student) ? save_student(person) : save_teacher(person)
    end

    File.write('./data/people.json', JSON.dump(@people_arr))
  end

  def save_rentals
    @cr_rentals.rentals.each do |rental|
      @rentals_arr << {
        'date' => rental.date,
        'book' => { 'title' => rental.book.title, 'author' => rental.book.author },
        'person' => rental.person.is_a?(Teacher) ? rental_teacher_details(rental) : rental_student_details(rental)
      }
    end

    File.write('./data/rentals.json', JSON.dump(@rentals_arr))
  end

  def rental_teacher_details(rental)
    {
      'id' => rental.person.id, 'age' => rental.person.age,
      'name' => rental.person.name, 'specialization' => rental.person.specialization
    }
  end

  def rental_student_details(rental)
    {
      'id' => rental.person.id, 'age' => rental.person.age, 'name' => rental.person.name,
      'parent_permission' => rental.person.parent_permission
    }
  end

  def save_teacher(person)
    @people_arr << {
      'id' => person.id,
      'specialization' => person.specialization,
      'name' => person.name,
      'age' => person.age
    }
  end

  def save_student(person)
    @people_arr << {
      'id' => person.id,
      'age' => person.age,
      'name' => person.name,
      'classroom' => person.classroom,
      'parent_permission' => person.parent_permission
    }
  end
end
