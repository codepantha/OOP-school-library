require './person'
# Student class
class Student < Person
  def initialize(age, name, classroom, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
