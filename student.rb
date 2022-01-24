require File.expand_path('person.rb', __dir__)
# Student class
class Student < Person
  def initialize(age, permission, name, classroom)
    super(age, permission, name)
    @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
