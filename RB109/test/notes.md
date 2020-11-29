# Notes for Assessment RB109

## Specific Topics of Interest

Be able to explain clearly the following topics:

- [local variable scope, especially how local variables interact with method invocations with blocks and method definitions](./local_variable_scopes.md)
- [how passing an object into a method definition can or cannot permanently change the object](./mutability_inmutability.md)
- [working with collections](./collections.md) (Array, Hash, String), and [popular collection methods](./collections_methods.md) (each, map, select, etc).
- [variables as pointers](https://launchschool.com/books/ruby/read/more_stuff#variables_as_pointers)
- [puts vs return](https://launchschool.com/books/ruby/read/methods#putsvsreturnthesequel)
- [false vs nil and the idea of "truthiness"](./truthiness.md)
- [method definition and method invocation](./method_definition_invocation.md)
- [implicit return value of method invocations and blocks](./implicit_return.md)


### Example 1

Testing your knowledge and understanding on more than one level.

```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```
Answer 'D'

The local variable `greeting` is assigned to the String `'Hello'` on line 1. The` do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block, within which `greeting` is reassigned to the String `'Hi'` on line 4. The `puts` method is called on line 8 with the variable `greeting` passed to it as an argument; since `greeting` is now assigned to `'Hi'`, this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

Notes on answer:

Answer 'D' goes a step further than 'C' by explaining why this is important and the underlying principle that it demonstrates; i.e. the fact that method invocations with blocks in Ruby have particular scoping rules which affect whether or not the local variable can be referenced or reassigned. Based on the way that this particular question is phrased, answer 'D' would be the only answer of the four to receive full points in an actual assessment.

### Example 2

Precision of Language

```ruby
def a_method
  puts "hello world"
end
```

Bad answer

The results of the method is hello world.

Good answer

The method outputs the string hello world, and returns nil.

Notes on answers

In programming, we are always concerned with the output and the return value and mutations to objects. We need to speak in those terms, and not use vague words like "results".

Keywords: return value, side effects, output

### Example 3

Some Specific Definitions

- Truthiness
In Ruby, every value apart from `false` and `nil`, evaluates to `true` in a boolean context. We can therefore say that in Ruby, every value apart from `false` and `nil` is _truthy_; we can also say that `false` and `nil` are _falsey_.

Use "evaluates to true" or "is truthy" when discussing an expression that evaluates to true in a boolean context
Do not use "is true" or "is equal to true" unless specifically discussing the boolean true.

Method Definition and Method Invocation

When discussing methods, particularly in terms of how blocks and methods interact with local variables, we want you to explain this in terms of method definition and method invocation. You can review this assignment for an outline of the mental model to use.

Integer, Fixnum and Bignum

Variables as pointers

If you call a method that _mutates the caller_, it will change the value in that address space, and any variables also pointing there will be affected. Therefore, always pay attention whether your variables are pointing to the same object (space in memory) or if they are dealing with copies that occupy different address space in memory.

Remember when we're passing in arguments to a method, we're essentially assigning a variable to another variable,  therefore both are pointing to the same object (space in memory). The aguments may or may not be mutated in the outer scope, depending on whether we modify the address space in memory that a is pointing to.