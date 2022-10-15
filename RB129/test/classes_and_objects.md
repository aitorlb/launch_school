# Classes and objects

Classes are templates from which objects are created. Classes define what states and behavior objects can have:
- States track information for individual objects and are implemented in Ruby via instance variables.
- Behaviors are what objects are capable of doing and are implemented in Ruby via instance methods.

Objects are instances of a class. The process of creating a new object or instance from a class is called instantiation. Individual objects of the same class may contain different state, but they all share the same behavior.

Classes are defined in Ruby using the `class` keyword followed by a name. The name must begin with a capital letter and by convention we use the CamelCase naming convention. The class definition is terminated by the `end` keyword.

Objects are instantiated in Ruby by calling `#new` on a class. Whenever a new object of a class is created using the `#new` method, Ruby looks for a method named `#initialize` and, if found, it is called on the newly created object with the arguments that were passed to the `#new` method. We refer to the `#initialize` method as a constructor, because it is a special method that builds the object when a new object is instantiated.

```ruby
class Greeter
  def greet
    puts "Hello! What is your name?"
  end
end

greeter1 = Greeter.new
greeter1.greet

greeter2 = Greeter.new
greeter2.greet
```

The above code defines a `Greeter` class with one method `#greet` that outputs the string `"Hello! What is your name?"` and returns `nil`.

Next, an instance of the class `Greeter` is created by calling `Greeter.new` with no arguments and assigned to the local variable `greeter1`. The method `#greet` is called on the `greeter1` which outputs the string `"Hello! What is your name?"` and returns `nil`.

Next, another instance of the class `Greeter` is created by calling `Greeter.new` with no arguments and assigned to the local variable `greeter2`. The method `#greet` is called on the `greeter2` which outputs the string `"Hello! What is your name?"` and returns `nil`.

Since the class `Greeter` does not define any instance variables, the objects it can create cannot hold different state from one another.

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
greeter1.greet

greeter2 = Greeter.new('Doe')
greeter2.greet
```

The above code defines a `Greeter` class with two methods:
- The `#initialize` method, which is always called during the initialization process, is defined with one required parameter `name`. The value of `name` is assigned to the instance variable `@name`.
- The `#greet` method that outputs the string `"Hello! My name is #{@name}. What is your name?"`, where `#{@name}` will be replaced by the value returned by `@name.to_s`. `#greet` returns `nil`.

Next, an instance of the class `Greeter` is created by calling `Greeter.new` with the argument `"John"` and assigned to the local variable `greeter1`. The method `#greet` is called on the `greeter1` which outputs the string `"Hello! My name is John. What is your name?"` and returns `nil`.

Next, another instance of the class `Greeter` is created by calling `Greeter.new` with the argument `"Doe"` and assigned to the local variable `greeter2`. The method `#greet` is called on the `greeter2` which outputs the string `"Hello! My name is Doe. What is your name?"` and returns `nil`.

Since the class `Greeter` defines an instance variable `@name`, the objects it can create can hold different state from one another: different objects may have different names.