# Classes and objects

An object is an instance of a class.

Objects are created from classes, so let's define classes first.

## Classes


Classes are templates from which objects are created. Classes define what state and behavior objects can have.

Objects are instances of a class. The process of creating a new object or instance from a class is called instantiation. Individual objects of the same class can contain different state.

Classes are defined in Ruby using the `class` keyword followed by a name. The name must begin with a capital letter and by convention we use the CamelCase naming convention. The class definition is terminated by the `end` keyword.

Objects are instantiated in Ruby by calling `new` on a class. Whenever a new object of a class is created using the `new` method, Ruby looks for a method named `initialize` and, if the method is found, it is called on the newly created object with the arguments that were passed to the `new` method.

```ruby
class Greeter
  def greet
    puts "Hello! What is your name?"
  end
end

greeter1 = Greeter.new('John')
greeter1.greet # => Hello! What is your name?

greeter2 = Greeter.new('Doe')
greeter2.greet # => Hello! What is your name?
```

```ruby
class Greeter
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}. What is your name?"
  end
end

greeter1 = Greeter.new('John')
greeter1.greet # => Hello! My name is John. What is your name?

greeter2 = Greeter.new('Doe')
greeter2.greet # => Hello! My name is Doe. What is your name?
```
