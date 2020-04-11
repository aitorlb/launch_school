# Notes on Special Topic of Interest for RB109:

## method definition and method invocation

Method definition is when, within our code, we define a Ruby method using the `def` keyword.

```ruby
def greeting
  puts "Hello"
end
```

Method invocation is when we call a method, whether that happens to be an existing method from the Ruby Core API or core Library, or a custom method that we've defined ourselves using the `def` keyword.

```ruby
greeting # Calling the greeting method outputs "Hello"
```
You should by this point be familiar with code like that shown in the above two examples.

- The `def..end` construction in Ruby is method definition
- Referencing a method name, either of an existing method or subsequent to definition, is method invocation
- Method invocation followed by `{..}` or `do..end` defines an associated block.
- An associated block is part of the method invocation
- An associated block can be called from within the method definition

References:
https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c
