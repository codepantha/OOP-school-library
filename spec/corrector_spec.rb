require 'rspec'
require_relative '../classes/corrector'
require_relative '../classes/student'

describe Corrector do
  before :all do
    @corrector = Corrector.new
  end

  it 'should capitalize a name' do
    student = Student.new(32, 'chike')
    expect(@corrector.correct_name(student.name)).to eq 'Chike'
  end
end
