# Setter and getter methods

Setter and getter methods are methods used to set or get the state of an object.

```ruby
class Dog
  def set_breed=(breed)
    @breed = breed
  end

  def get_breed
    @breed
  end
end

dog = Dog.new
dog.set_breed = 'Dalmatian'
dog.get_breed
```

In the code above, a `Dog` class is defined with two methods:
- The `#set_breed=` method is defined with one required parameter `breed`. The value referenced by `breed` is assigned to the instance variable `@breed`. Because the method name ends in `=`, Ruby allows us to use the assignment syntax when calling the method: `object.set_breed = breed` instead of `object.set_breed=(breed)`. Also, when it comes to the return value, the same rules as in regular assignment apply: the right-hand value is always returned no matter what the body of the method returns.
- The `#set_breed` method which returns the value of the instance variable `@breed`.

Next, an instance of the class `Dog` is created by calling `Greeter.new` with no arguments and assigned to the local variable `dog`. Then, the method `#set_breed=` is called on the object referenced by `dog` which the argument `"Dalmatian"` which makes the instance variable `@breed` to point to the argument. Then, the method `#set_breed` is called on the object referenced by `dog` which returns the string `"Dalmatian"`.

Because the method `set_breed=` allows to change the value of an attribute to be the value passed as argument, it is considered a setter method. Because the method `set_breed` allows to retrieve the value of an attribute, it is considered a getter method. In Ruby, however, the convention is to name getter and setter methods using the same name as the instance variable they are exposing and setting. Thus, we could refactor the code as follows:

```ruby
class Dog
  def breed=(breed)
    @breed = breed
  end

  def breed
    @breed
  end
end

dog = Dog.new
dog.breed = 'Dalmatian'
dog.breed
```

Because these methods are so commonplace, Ruby has a built-in way to automatically create these getter and setter methods for us, using the `attr_accessor` method. Thus, we could refactor the code as follows:

```ruby
class Dog
  attr_accessor :breed
end

dog = Dog.new
dog.breed = 'Dalmatian'
dog.breed
```

The `attr_accessor` method defines a setter and a getter method names as the argument, for each argument that was passed. Besides the `attr_accessor` method, we have two more methods to automatically define getter and setter methods:
- The `attr_writer` method which only defines a setter method.
- The `attr_reader` method which only defines a getter method.

Thus, we could refactor the code as follows:

```ruby
class Dog
  attr_writer :breed
  attr_reader :breed
end

dog = Dog.new
dog.breed = 'Dalmatian'
dog.breed
```
