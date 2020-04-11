# Notes on Special Topic of Interest for RB109:

## Local variable scope, especially how local variables interact with method invocations with blocks and method definitions

#### Variable scope

- A variable's scope determines where in a program a variable is available for use.
- A variable's scope is defined by where the variable is initialized or created.
- Generally, the scope of a local variable is one of

    proc{ ... }
    loop{ ... }
    def ... end
    class ... end
    module ... end
    the entire program (unless one of the above applies)

#### How local variables interact with method definition

- A method definition creates its own scope outside the regular flow of execution.
- Local variables within a method definition cannot be referenced from outside of the method definition.
- A method definition cannot reference local variables initialized outside of the method definition.
- A parameter is a variable in a method definition.
- By defining parameters, a method definition can access objects outside of the method definition.
- Objects passed in at method invocation will be assigned to method parameters and thus made available to the method body as locals variables.

#### How local variables interact with method invocations

- Objects can be passed as an argument to a method at invocation.
- Arguments are the actual value of parameters that get passed to the method.

```ruby
a = 'hi'

def some_method
  puts a
end

some_method

def some_method(a)
  puts a
end

some_method(5)
```

Variable `a` is initialized and assigned to the String `'hi'`.

Method `some_method` is defined without parameters and in its body the method `Kernel#puts` is invoked with one argument, a local variable `a` that has not been initialized inside the method body. Then, `some_method` is invoked, which will raise a `NameError` since the method does not have access to the local variable `a` assigned in the outer scope.

Another method name `some_method` is defined with a parameter `a` and in its body the method `Kernel#puts` is invoked with one argument, the local variable `a` that references the argument passed. Then, `some_method` is invoked, which will output the String `'5'`.

In the example above, the Integer `5` is passed into `some_method` as an argument, assigned to the method parameter, `a`, and thus made available to the method body as a local variable. That's why we can call `puts a` from within the method definition.

#### How local variables interact with blocks

- A block is a piece of code following a method invocation, usually delimited by either curly braces `{}` or `do/end`.
- A block creates an inner scope that inherits the scope from the context it is defined in.
- Inner scope can access variables initialized in an outer scope, but not vice versa.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  salute = 'Howdy'
  break
end

puts greeting
puts salute
```

The local variable `greeting` is assigned to the String `'Hello'` on line 1. The` do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block, within which `greeting` is reassigned to the String `'Hi'` on line 4 and the local variable `salute` is assigned to the String `'Howdy'` on line 5. The `puts` method is called on line 9 with the variable `greeting` passed to it as an argument; since `greeting` is now assigned to `'Hi'`, this is what is output. The `puts` method is called on line 10 with the variable `salute` passed to it as an argument, which raises `NameError`. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block but not viceversa.

References:
https://launchschool.com/books/ruby/read/variables
http://phrogz.net/programmingruby/tut_expressions.html
https://ruby-doc.com/docs/ProgrammingRuby/html/tut_io.html
https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/localvars.html
https://www.oreilly.com/library/view/the-ruby-programming/9780596516178/ch04s02.html
https://gist.github.com/jodosha/229951
https://www.ruby-lang.org/en/documentation/faq/4/