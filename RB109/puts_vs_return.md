# Notes on Special Topic of Interest for RB109:

## puts vs return

### Implicit return

In Ruby, every method returns the value of the last evaluated expression.

### Explicit return

Ruby provides a keyword that allows the developer to explicitly stop the execution flow of a method and return a specific value.

The `return` keyword returns `nil` if no value is passed as argument.


### puts

The method `Kernel#puts` outputs the objects passed as arguments to the console as String. Returns `nil`.

More precisely, it is equivalent to calling `$stdout#puts`, which writes the given objects to the Input/Output stream referenced by `$stdout`.

References:
- https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel
- https://thoughtbot.com/blog/io-in-ruby
- https://docs.ruby-lang.org/en/2.1.0/IO.html
