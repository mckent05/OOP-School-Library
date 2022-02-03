require_relative '../book'
require_relative '../teacher'
require_relative '../rental'

describe Book do
  context 'When testing Book' do
    it 'Testing the book should pass the tests' do
      book1 = Book.new('Manchester United', 'Alex Ferguson')

      person1 = Teacher.new(specialization: 'agric', age: 44, name: 'Mason', parent_permission: true)

      book1.add_rental('2/2/22', person1)

      expect(book1.author).to eq 'Alex Ferguson'
      expect(book1.rental.first.person.name).to eq 'Mason'
    end
  end
end
