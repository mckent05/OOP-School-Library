class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
