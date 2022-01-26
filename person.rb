require './corrector'
# Person class
class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  attr_reader :id
  attr_accessor :name, :age

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
end
