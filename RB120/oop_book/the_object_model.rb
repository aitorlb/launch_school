=begin
Exercises

1. How do we create an object in Ruby? Give an example of the creation of an 
  object.

We create an object or instance of a class by calling the method `::new` on 
that class.

class Dog
end

dog = Dog.new
p dog.class #=> Dog

2. What is a module? What is its purpose? How do we use them with our classes? 
  Create a module for the class you created in exercise 1 and include it 
  properly.

A module is a collection of behaviours that is usable in other classes via 
`mixins`. A module is "mixed in" to a class using the `include` method 
invocation.

module Speak
  def speak(sound)
    puts sound
  end
end

class Dog
  include Speak
end

dog = Dog.new
p dog.ancestors #=> [GoodDog, Speak, Object, Kernel, BasicObject]

=end
