=begin
Exercises
1. Add a class method to your MyCar class that calculates the gas mileage of any car.

2. Override the to_s method to create a user friendly print out of your object.

3. When running the following code...

  ```
  class Person
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  bob = Person.new("Steve")
  bob.name = "Bob"
  ```

  We get the following error...

  ```
  test.rb:9:in `<main>': undefined method `name=' for
    #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
  ```

  Why do we get this error and how do we fix it?
=end

class MyCar
  attr_accessor :color
  attr_reader   :year

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
