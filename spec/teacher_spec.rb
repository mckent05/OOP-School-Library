require_relative '../teacher'

describe Teacher do
  context 'When testing Teacher' do
    it 'Teacher class should pass the following' do
      maths_teacher = Teacher.new(specialization: 'Mathematics', age: 45, name: 'Daniel', parent_permission: true)

      expect(maths_teacher.age).to be 45
      expect(maths_teacher.can_use_services?).to be true
    end
  end
end
