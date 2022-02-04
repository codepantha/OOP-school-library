require 'rspec'
require_relative '../classes/student'

describe Student do
  context 'When testing Student class' do
    it 'is Initialized correctly' do
      student = Student.new(32, 'CodePanther', 'Class B', 320, parent_permission: false)

      student_details = [student.id, student.age, student.name, student.parent_permission, student.classroom]

      expect(student_details).to eq [320, 32, 'CodePanther', false, 'Class B']
    end

    it 'play_hookey should returns "¯\(ツ)/¯"' do
      student = Student.new(32, 'CodePanther')

      expect(student.play_hookey).to eq "¯\(ツ)/¯"
    end
  end
end
