require 'rspec'
require_relative '../classes/teacher'

describe Teacher do
  context 'When testing Teacher class' do
    it 'should be initialized correctly!' do
      teacher = Teacher.new('Physician', 'Mohamed', 52)

      teacher_details = [teacher.specialization, teacher.name, teacher.age]

      expect(teacher_details).to eq ['Physician', 52, 'Mohamed']
    end

    it 'can_use_services? should always return true' do
      teacher = Teacher.new('Physician', 'Mohamed', 52)

      expect(teacher.can_use_services?).to be true
    end
  end
end
