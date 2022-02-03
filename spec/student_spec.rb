require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'when testing students' do
    it 'should print the student name' do
      student1 = Student.new(classroom: @classroom, age: 12, name: 'Tunde', parent_permission: true)

      art_class = Classroom.new('art')

      art_class.add_student(student1)

      expect(student1.name).to eq 'Tunde'

      expect(student1.can_use_services?).to be false

      expect(student1.classroom.label).to eql 'art'
    end
  end
end
