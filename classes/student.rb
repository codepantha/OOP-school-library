require_relative 'person'
# Student class
class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name, classroom, id = 'auto', parent_permission: true)
    @classroom = classroom
    super(age, name, id, parent_permission: parent_permission)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
