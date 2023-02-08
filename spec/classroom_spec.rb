require_relative '../classroom'

describe Classroom do
  before :all do
    @classroom = Classroom.new('label_2')
  end

  context 'unit test for classroom' do
    it 'should have the label label_1' do
      label = @classroom.label
      expect(label).to eq 'label_2'
    end
  end
end
