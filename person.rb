# frozen_string_literal: true

# Person class
class Person
  def initialize(age, parent_permission = 'true', name = 'Unknown')
    @id = 123
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
