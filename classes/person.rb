require_relative 'corrector'

# Person class
class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', id = 'auto', parent_permission: true)
    # @id = Random.rand(1..100)
    @id = id == 'auto' ? Random.rand(1..100) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def validate_name(name)
    @name = @corrector.correct_name(name)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
