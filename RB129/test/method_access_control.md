# Method Access Control

Method Access Control is the concept of allowing or restricting the access to the methods defined in a class using access modifiers: `public`, `private`, and `protected` access modifiers.

When prepending an access modifier method call to a method definition, the access modifier only applies to the method defined inmediately after. When the access modifier method call is used in its own line, the access modifier will apply to any method defined below it (unless access modifier method call is called after it to negate it). Note: methods defined without an access modifier are public methods by default.

## Public methods

Public methods are available to anyone who knows how to reference the owner of the methods. These methods comprise the class's interface (that's how other classes and objects will interact with this class and its objects).

```ruby
class Dog
  def bark
    "Woof!"
  end
end

dog = Dog.new
dog.bark # => "Woof!"
```

```ruby
class Dog
  public def bark
    "Woof!"
  end
end

dog = Dog.new
dog.bark # => "Woof!"
```

```ruby
class Dog
  public

  def bark
    "Woof!"
  end
end

dog = Dog.new
dog.bark # => "Woof!"
```

## Private methods

Private methods are only accessible from other methods in the class.

```ruby
class Dog
  def bark
    random_bark
  end

  private def random_bark
    ["Woof!", "Bup!", "Guau!"].sample
  end
end

dog = Dog.new
dog.bark # => One of ["Woof!", "Bup!", "Guau!"]
```

```ruby
class Dog
  def bark
    random_bark
  end

  private

  def random_bark
    ["Woof!", "Bup!", "Guau!"].sample
  end
end

dog = Dog.new
dog.bark # => One of ["Woof!", "Bup!", "Guau!"]
```

## Protected methods

Protected methods are similar to private methods in that they cannot be invoked outside the class. The main difference between them is that protected methods allow access between class instances, while private methods do not.

```ruby
class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

person1 = Person.new(64)
person2 = Person.new(42)

person1.older?(person2)  # => true
person2.older?(person1)  # => false

person1.age
  # => NoMethodError: protected method `age' called for #<Person: @age=64>
```
