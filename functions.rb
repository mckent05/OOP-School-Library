require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'teacher'
require_relative 'person'

class Appfunction
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def actions(action)
    case action
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental

    when '6'
      rental_for_id
    else
      puts 'Enter a valid input between 1-7'
    end
  end

  def list_all_books
    puts 'Books: '
    @books.each_with_index.map { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author} " }
  end

  def list_all_people
    puts 'People: '
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or Teacher (2) [Input the number]: '
    person = gets.chomp
    case person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please select a valid option, 1 or 2'
      nil
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Have parent permission enter [y/n]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(@classroom, age, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person Created Successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    puts 'Person Created Successfully'
    @people.push(teacher)
  end
end
