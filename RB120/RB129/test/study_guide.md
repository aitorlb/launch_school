# Study Guide for Test

## Specific Topics of Interest

- [Classes and objects](./classes_and_objects.md)
- [Use `attr_*` to create setter and getter methods](./getter_and_setter_methods.md)
- [How to call setters and getters](./getter_and_setter_methods.md)
- Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope
- Instance methods vs. class methods
- Method Access Control
- Referencing and setting instance variables vs. using getters and setters
- Class inheritance, encapsulation, and polymorphism
- Modules
- Method lookup path
- `self`
- Reading OO code
- Fake operators and equality
- Working with collaborator objects

## Precision of Language

Some questions require that you explain code or concepts with words. It's important to explain how code works using precise vocabulary and to pinpoint the causal mechanism at work. In other words, use the right words and don't be vague.

For example, let's take the following piece of code.

```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Woof! My name is #{@name}."
  end
end
```

If we ask you to describe this code, you may say that "It defines a Dog class with two methods: an initializer and a method that has a message as a result." This description isn't wrong, but it's imprecise and lacks some essential details. An answer like this may receive a score of 5/10 on a 10-point question; 50% is not a passing score.

A more precise answer says that "This code defines a Dog class with two methods:

- The `#initialize` method that initializes a new `Dog` object, which it does by assigning the instance variable `@name` to the dog's name specified by the argument.
- The `#say_hello` instance method which prints a message that includes the dog's name in place of `#{@name}`. `#say_hello` returns `nil`."


In programming, we must always concern ourselves with outputs, return value, and object mutations. We must use the right terms when we speak, and not use vague words like "results." Furthermore, we need to be explicit about even the smallest details.

When writing answers to test questions, make sure you're as precise as possible, and that you use the proper vocabulary. Doing this helps you debug and understand more complex code later in your journey. If your definitions are imprecise, you can't use them to decompose a complicated method or program. Also, you may be unable to pass the test.

## Additional Tips

This assessment has a different style than the RB109 written assessment,so you should expect several open-ended questions where you will need to explain certain OOP concepts using code examples.

While working through the assessment questions it is useful to run your code often to check it, so make sure to have either ruby document/terminal or an online repl prepared beforehand.
