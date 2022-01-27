require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rental = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
