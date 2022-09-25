# How to call setters and getters

Setter and getter methods are methods that change or expose the state of an object.

```ruby
class Dog
  attr_accessor :breed

  def reset_breed
    self.breed = nil
  end
end

dog = Dog.new
dog.breed = 'Dalmatian'
dog.reset_breed
dog.breed
```

In the code above, a `Dog` class is defined with three methods:
- The `#breed=` setter method and the `#breed` getter method are defined automatically by calling `::attr_accessor` with the argument `:breed`.
- The `#reset_breed` method calls the setter method `#breed=` on `self` with the argument `nil`, assigning `nil` to the instance variable `@breed`.

Next, an instance of the class `Dog` is created by calling `Greeter.new` with no arguments and assigned to the local variable `dog`. Then, the method `#breed=` is called on the object referenced by `dog` which the argument `"Dalmatian"` which makes the instance variable `@breed` to point to the argument. Then, the method `#reset_breed` is called on the object referenced by `dog` which assigns `nil` to the instance variable `@breed` and returns `nil`. Then, the method `#breed` is called on the object referenced by `dog` which returns the value of the instance variable `@breed`: `nil`.

When it comes to calling a setter method inside a class definition, because Ruby allows us to use the assignment syntax when calling a setter method: `dog.breed = 'Dalmatian'` instead of `dog.breed=('Dalmatian')`, it is needed to use `self` to disimbiguate from creating a local variable.

If instead we define the class as follows:

```ruby
class Dog
  attr_accessor :breed

  def reset_breed
    breed = nil
  end
end

dog = Dog.new
dog.breed = 'Dalmatian'
dog.reset_breed
dog.breed
```

We will find that the last line `dog.breed` returns the string `"Dalmatian"`, instead of `nil`. This is because in the body of the `#reset_breed` method, instead of a call to the `#breed=` method, a local variable assignment is taking place `breed = nil`.
