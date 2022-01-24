# frozen_string_literal: true

require File.expand_path('person.rb', __dir__)
# Teacher class
class Teacher < Person
  def initialize(specialization, name, age, parent_permission = nil)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def of_age?
    true
  end
end
