# Instance methods vs. class methods

## Instance methods

Instance methods are available to objects (or instances) of that class. Instance methods are defined inside the class body. They can be referenced from other instance methods and have access to both instance and class variables.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def short_greet
    'Hello!'
  end

  def long_greet
    "#{short_greet} My name is #{@name}. What is your name?"
  end
end

person = Person.new('John Doe')
person.short_greet # => "Hello!"
person.long_greet  # => "Hello! My name is John Doe. What is your name?"
```

In the code above, a `Person` class is defined with three methods:
- The `#initialize` instance method which assigns the value assigned to the `name` parameter to the instance variable `@name`.
- The `#short_greet` instance method which returns a string with value `"Hello!"`.
- The `#long_greet` instance method which references the `#short_greet` instance method and the instance variabel `@name` in its body and returns a string with the value `"#{short_greet} My name is #{name}. What is your name?"`, where `#{short_greet}` will be replaced by the return value of the method `#short_greet` and `#{name}` will be replaced by the value assigned to instance variable `@name`.

## Class methods

Class methods are available to classes. Class methods are defined inside the class body by prepending the `self` keyword. They can be referenced from other class methods and have access to class variables.

```ruby
class Person
  @@number_of_persons = 0

  def initialize
    @@number_of_persons += 1
  end

  def self.number_of_persons
    @@number_of_persons
  end
end

Person.number_of_persons # => 0
person = Person.new
Person.number_of_persons # => 1
```

In the code above, a `Person` class is defined with two methods:
- The `#initialize` instance method which increases the value assigned to the class variable `@@number_of_persons` by one.
- The `::number_of_persons` class method which returns the value assigned to the class variable `@@number_of_persons`.
