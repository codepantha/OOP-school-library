require 'rspec'
require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Amr Hub')
  end

  context 'When testing Classroom' do
    it 'should initialize correctly' do
      expect(@classroom.label).to eq 'Amr Hub'
    end

    it 'add_student should increase the students' do
      student = Student.new(12, 'Zoe', @classroom)
      @classroom.add_student(student)
      @classroom.add_student(student)

      expect(@classroom.students.length).to eq 2
    end
  end
end
