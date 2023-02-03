require './decorators'
require './rental'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    return true if @age >= 18

    false
  end
  # rubocop:enable Naming/PredicateName
end
