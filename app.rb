require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_index do |index|
      puts "#{index} => Title: #{@books[index].title}  |  Author: #{@books[index].author}"
    end
  end

  def list_people
    label = nil
    @people.each_index do |index|
      if @people[index].instance_of? Teacher
        label = '[Teacher]'
      elsif @people[index].instance_of? Student
        label = '[Student]'
      end
      puts "#{index} => #{label}:  Name: #{@people[index].name}\
  |  Age: #{@people[index].age} | Id: #{@people[index].id}"
    end
  end

  def create_person(age, name, type, permission = nil, spec = nil)
    case type
    when '1'
      person = Student.new(age, name, permission)
      @people << person
    when '2'
      person = Teacher.new(age, name, spec)
      @people << person
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, book_index, person_index)
    book = @books[book_index.to_i]
    person = @people[person_index.to_i]
    @rentals << Rental.new(date, book, person)
  end

  def list_rentals(person_id)
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" By #{rental.book.author}"
      end
    end
  end
end
