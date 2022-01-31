require_relative 'functions'

class App
  def initialize
    @appfn = Appfunction.new
  end

  def run_app
    loop do
      puts

      display_actions

      option = gets.chomp

      break if option == '7'

      @appfn.actions(option)
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
end

def main
  start = App.new
  puts 'Welcome to School Library App!'
  start.run_app
end

main
