# Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

## Instance variables

Instance variables are defined starting with a `@` symbol. They are used to track individual object state, and do not cross over between objects.

For example, in the below code, the instance variable `@name` has a different value assigned inside each object.

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

Instance variables are scoped at the object level, meaning it can be referenced from any of an object's instance methods. In the example above, the instance variable `@name` is accessible in the instance method `#name` even though it was initialized inside the method `#initialize` and was not passed in as argument.

If you try to reference an uninitialized local variable, you'd get a `NameError`. But if you try to reference an uninitialized instance variable, you get `nil`.

```ruby
class Person
  attr_accessor :name
end

bob = Person.new
bob.name # => nil
```

## Class variables
