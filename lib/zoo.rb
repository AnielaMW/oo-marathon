class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date

    @employees = []
    @cages = []
    create_ten_cages
  end

  def create_ten_cages
    10.times { @cages << Cage.new }
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date
  end

  def add_animal(new_animal)
    if cages_full?
      raise ZooAtCapacity
    else
      cage_number = 0
      @cages.each do |cage|
        if cage.empty? == false
          cage_number += 1
        end
      end
      @cages[cage_number].animal = new_animal
    end
  end

  def cages_full?
    @cages.all? {|cage| !cage.empty?}
  end

  def visit
    greetings = ""
    @employees.each do |employee|
      greetings << employee.greet + "\n"
    end
    @cages.each do |cage|
      greetings << cage.animal.speak + "\n" if !cage.empty?
    end
    greetings
  end
end
