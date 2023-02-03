require './app'

class Main
  def initialize(message, app)
    @message = message
    @app = app
  end

  def check_permission_input(permission_input)
    case permission_input
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Please Enter a Valid option'
      exit
    end
  end

  def create_person_by_type(age_input, name_input, type_input)
    case type_input
    when '1'
      print "Does the student have their parent's permission? [Y/N] "
      permission_input = gets.chomp.upcase
      permission = check_permission_input(permission_input)
      @app.create_person(age_input, name_input, type_input, permission)
    when '2'
      print 'What is the specialization of the teacher? '
      spec_input = gets.chomp
      @app.create_person(age_input, name_input, type_input, nil, spec_input)
    else
      puts 'Please Enter a Valid option'
      launch
    end
  end

  def handle_person
    print 'Do you want to create a (1) student OR a (2) teacher: '
    type_input = gets.chomp
    print 'Enter the person name: '
    name_input = gets.chomp
    print 'Enter the person age: '
    age_input = gets.chomp
    create_person_by_type(age_input, name_input, type_input)
    puts 'Person Created Successfully'
  end

  def handle_book
    print "Enter the book's title: "
    btitle_input = gets.chomp
    print "Enter the book's author: "
    bauthor_input = gets.chomp
    @app.create_book(btitle_input, bauthor_input)
    puts 'Book Created Successfully'
  end

  def handle_rental
    @app.list_books
    print 'Please pick one of the available books: '
    input_book_index = gets.chomp
    @app.list_people
    print 'Please define the person renting the book: '
    input_renter_index = gets.chomp
    print 'Please enter the rental date [yyyy-mm-dd]:  '
    input_date = gets.chomp
    @app.create_rental(input_date, input_book_index, input_renter_index)
    print 'Rental created successfully'
  end

  def launch
    puts @message
    input = gets.chomp

    case input
    when '1'
      @app.list_books
      launch
    when '2'
      @app.list_people
      launch
    when '3'
      handle_person
      launch
    when '4'
      handle_book
      launch
    when '5'
      handle_rental
      launch
    when '6'
      print 'Enter the ID of the person: '
      input_id = gets.chomp
      @app.list_rentals(input_id.to_i)
      launch
    when '7'
      puts 'Exiting....'
      exit
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

def main
  welcome_message = "\n################################\nWelcome to School Library App! \n\n
  Please choose an option to proceed:\n
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit "
  app = App.new

  Main.new(welcome_message, app).launch
end

main
