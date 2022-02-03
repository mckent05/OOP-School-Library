require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Testing the Rental clas should pass the following test' do
    book1 = Book.new('Manchester United', 'Alex Ferguson')
    person1 = Teacher.new(specialization: 'agric', age: 44, name: 'Mason', parent_permission: true)
    first_rental = Rental.new('2/2/22', person1, book1)

    it 'should return Manchester United' do
      expect(first_rental.book.title).to eq 'Manchester United'
    end

    it 'should return Mason' do
      expect(first_rental.person.name).to eq 'Mason'
    end
  end
end
