require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  context 'When testing the Person class' do
    it 'should print name as akinlade' do
      book1 = Book.new('yellow sun', 'myself')

      person1 = Person.new(age: 20, name: 'akinladestevenwande', parent_permission: true)

      person1.validate_name
      person1.add_rental('20/20/20', book1)
      name = person1.name

      expect(name).to eq 'Akinladest'

      expect(person1.rental.length).to be 1

      expect(person1.can_use_services?).to be true
    end
  end
end
