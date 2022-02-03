require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'when testing the classroom class' do
    art_class = Classroom.new('art')
    student1 = Student.new(classroom: @classroom, age: 12, name: 'Tunde', parent_permission: true)

    it 'it should return art' do
      expect(art_class.label).to eq 'art'
    end

    it 'should return Tunde' do
      art_class.add_student(student1)
      expect(art_class.student.first.name).to eq 'Tunde'
    end
  end
end
