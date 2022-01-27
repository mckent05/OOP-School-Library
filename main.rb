require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'teacher'
require_relative 'person'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def run_app
    loop do
      puts

      display_actions

      option = gets.chomp

      break if option == '7'

      actions(option)
    end

    puts 'Thank you for using the Library'
  end

  private

  def display_actions
    puts 'Please choose an option by entering a number'
    puts '1- List all books'
    puts '2- List all people'
    puts '3- Create a Person'
    puts '4- Create a Book'
    puts '5- Create a rental'
    puts '6- List all rental for a given person id'
    puts '7- Exit'
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

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book Created sucessfully'
  end

  def create_rental
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index.map do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    selected_person = gets.chomp.to_i
    puts 'Select a book from the following list by number'
    @books.each_with_index.map { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i

    print 'Enter Date in this format DD/MM/YYY: '
    date = gets.chomp
    if selected_person > @people.length || selected_book > @people.length
      puts 'Inavlid selection for person or book choice'
    else
      new_rental = Rental.new(date, @people[selected_person], @books[selected_book])
      @rentals.push(new_rental)
      puts 'Rental Created succesfully'
    end
  end

  def rental_for_id
    @people.each_with_index.map do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by Author: #{rental.book.author} "
      end
    end
  end
end

def main
  start = App.new
  puts 'Welcome to School Library App!'
  start.run_app
end

main
