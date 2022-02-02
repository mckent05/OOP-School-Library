require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'teacher'
require_relative 'person'
require 'json'
require 'pry'

module RetainData
  def list_people
    file = 'person.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |person|
        if person['type'] == 'Student'
          Student.new(classroom: @classroom, id: person['id'], age: person['age'], name: person['name'],
                      parent_permission: person['parent_permission'])
        else
          Teacher.new(specialization: @specialization, id: person['id'], age: person['age'], name: person['name'])
        end
      end
    else
      []
    end
  end

  def save_person
    person_json = []
    @people.each do |person|
      person_json.push({ type: person.class, name: person.name, age: person.age, id: person.id })
    end
    File.write('person.json', JSON.generate(person_json))
  end

  def save_books
    books_json = []
    @books.each do |book|
      books_json.push({ author: book.author, title: book.title })
    end
    File.write('book.json', JSON.generate(books_json))
  end

  def list_books
    file = 'book.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def get_person(id)
    people = list_people
    people.each { |person| return person if person.id == id }
  end

  def get_book(title)
    books = list_books
    books.each { |book| return book if book.title == title }
  end

  def save_rentals
    rental_json = []
    @rentals.each do |rental|
      rental_json.push({ date: rental.date, id: rental.person.id, title: rental.book.title })
    end
    File.write('rental.json', JSON.generate(rental_json))
  end

  def list_rentals
    file = 'rental.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |r|
        person = get_person(r['id'])
        book = get_book(r['title'])
        Rental.new(r['date'], person, book)
      end
    else
      []
    end
  end

  def save_operation
    save_person unless @people.empty?
    save_books unless @books.empty?
    save_rentals unless @rentals.empty?
  end
end
