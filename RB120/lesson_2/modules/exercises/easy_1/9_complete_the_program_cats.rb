=begin
Complete the Program - Cats!

Consider the following program.
=end

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding
# My cat Pudding is 7 years old and has black and white fur.
puts butterscotch
# My cat Butterscotch is 10 years old and has tan and white fur.
