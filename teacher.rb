require './person'
# Teacher class
class Teacher < Person
  attr_reader :specialization
  attr_reader :age

  def initialize(specialization, name, age)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
