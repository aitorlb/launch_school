# Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

## Instance variables

Instance variables are defined starting with a `@` symbol like so: `@instance_variable`. They are used to track individual object state, and do not cross over between objects.

For example, in the below code, the instance variable `@name` has a different value assigned when referenced from each object.

```ruby
class Person
  attr_reader :name

  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

bob.name # => "bob"
joe.name # => "joe"
```

Instance variables are scoped at the object level, meaning they can be referenced from any instance method. In the example above, the instance variable `@name` is accessible in the instance method `#name` even though it was initialized inside the method `#initialize` and was not passed in as argument.

If you try to reference an uninitialized local variable, you'd get a a `NameError` exception exception. But if you try to reference an uninitialized instance variable, you get `nil`.

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name # => nil
```

## Class variables

Class variables are defined starting with two `@` symbols like so: `@@class_variable`. They are used to track class state, and do cross over between objects.

For example, in the below code, the class variable `@@number_of_persons` has the same value assigned when referenced from the class and each object.

```ruby
class Person
  @@number_of_persons = 0

  def initialize(n)
    @number_of_persons += 1
  end

  def number_of_persons_excluding_me
    @@number_of_persons - 1
  end

  def self.number_of_persons
    @@number_of_persons
  end
end

Person.number_of_persons               # => 0

person1 = Person.new

Person.number_of_persons               # => 1
person1.number_of_persons_excluding_me # => 0

person2 = Person.new

Person.number_of_persons               # => 2
person2.number_of_persons_excluding_me # => 1
```

Class variables are scoped at the class level, meaning they can be referenced from any class method or instance method. All objects from a class share the same the class variables. In the example above, the class variable `@@number_of_persons` is accessible in the instance methods `#initialize` and `#number_of_persons_excluding_me` even though it was initialized in the `Person` class definition and was not passed in as argument.

Similarly to instance variables, if you try to reference an uninitialized class variable, you get `nil` instead of a a `NameError` exception exception.

```ruby
class Person
  def self.number_of_persons
    @@number_of_persons
  end
end

Person.number_of_persons # => nil
```

## Constants

Constants are defined starting with an upper case letter like so: `CONSTANT`. While technically constants just need to begin with a capital letter, the convention is to make the entire variable uppercase. They are used to track state that is not supposed to change. While technically constants can be reassigned and the object assigned to them can be mutated, best practices dictate not doing so. Ruby will throw a warning when reassigning a new value to constants but will not complain at all when mutating objects assigned to constants.

For example, in the below code, the constant `DOG_YEARS` has the same value assigned when referenced from the class and each object.

```ruby
class Dog
  DOG_YEARS = 7

  attr_accessor :age

  def initialize(age)
    self.age = age
  end

  def dog_years
    age * DOG_YEARS
  end

  def self.dog_years
    DOG_YEARS
  end
end

dog1 = Dog.new(4)
dog2 = Dog.new(2)

Dog.dog_years         # => 7
dog1.age              # => 4
dog1.age_in_dog_years # => 28
dog2.age              # => 2
dog2.age_in_dog_years # => 14
Dog::DOG_YEARS        # => 7
```

Constants have lexical scope, meaning that where the constant is defined in the source code determines where it is available. For a more in depth explanation of how constant variable scope works, [read this](../../RB120/lesson_3/constant_variable_scope.md). Unlike class or instance variables, constants initialized inside a module or a class (namespaced) can be reached from outside of the module or class using `::`, which is the namespace resolution operator.

Unlike class and instance variables, if you try to reference an uninitialized constant, you get a `NameError` exception.

```ruby
SOME_CONSTANT_THAT_DOES_NOT_EXIST # => NameError
```

Constants cannot be initialized inside a method (unless using metaprogramming), you get a `SyntaxError` exception.

```ruby
def define_constant
  PI = 3.14
end # => SyntaxError (dynamic constant assignment)
```
