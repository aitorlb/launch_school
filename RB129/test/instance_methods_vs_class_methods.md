# Instance methods vs. class methods

## Instance methods

Instance methods are methods defined inside a class definition. Instance methods pertain to an instance or object of a class and they can be referenced from anywhere inside the class definition. Public instance methods can be called on objects.


```ruby
class Person
  def short_greet
    'Hey!'
  end

  def long_greet
    "#{short_greet} How you doin'?"
  end
end

Person.new.short_greet
Person.new.long_greet
```

In the code above, a `Person` class is defined with two methods:
- The `#short_greet` instance method which returns a string with value `'Hey!'`.
- The `#long_greet` instance method which references the `#short_greet` in its body and returns a string with the value `"#{short_greet} How you doin'?"`, where `#{short_greet}` will be replaced by the return value of the method `#short_greet`.
