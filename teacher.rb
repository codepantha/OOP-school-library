# frozen_string_literal: true

require './person'
# Teacher class
class Teacher < Person
  attr_reader :specialization, :age

  def initialize(specialization, name, age, id = 'auto')
    super(name, age, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
