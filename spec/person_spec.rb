require 'rspec'
require './classes/person'

describe Person do
  context 'When testing Person class' do
    it 'Should be initialized by age and others are automatically generated' do
      person = Person.new(32)

      person_details = [!person.id.nil?, person.age, person.name, person.parent_permission]

      expect(person_details).to eq [true, 32, 'Unknown', true]
    end

    it 'Should be initialized by age, name, id and others are automatically generated' do
      id = rand(1..100)
      person = Person.new(32, 'CodePanther', id)

      person_details = [person.id, person.age, person.name, person.parent_permission]

      expect(person_details).to eq [id, 32, 'CodePanther', true]
    end

    it 'can_use_services? should return true when age > 18 and has parent_permission' do
      person = Person.new(32)

      expect(person.can_use_services?).to be true
    end

    it 'can_use_services? should return true when age < 18 and doesn\'t has parent_permission' do
      person = Person.new(15, parent_permission: false)

      expect(person.can_use_services?).to be false
    end
  end
end
