# Notes on Special Topic of Interest for RB109:

## implicit return value of method invocations and blocks

### Implicit return value

Implicit return refers to the fact that, unless returned prematurely, the return value of a method or block is simply the value of the last expression evaluated in its body.

```ruby
def add(a, b)
  a + b
end

add(1, 2)
# => 3

[1, 2].map do |e|
    e.to_s
end
# => ["1", "2"]
```

### Explicit return value

Explicit return refers to the fact that Ruby supports a number of statements to force a return prior to the end of the method or block's body.

`return`
Causes a method to exit and return a value to its caller.

```ruby
def add(a, b)
  return a
  a + b
end

add(1, 2)
# => 1
```

`break`
Causes a loop (or iterator) to exit and return a value to its caller.

```ruby
[1, 2].map do |e|
    break e
    e.to_s
end
# => 1
```

`next`
Causes a loop (or iterator) to skip the rest of the current iteration and move on to the next iteration.

```ruby
[1, 2].map do |e|
    next -e
    e.to_s
end
# => [-1, -2]
```

If an expression follows the `return`, `break`, `next` keywords, then the value of that expression is returned.
If no expression follows, then the return value is `nil`.


References:
https://ruby-doc.com/docs/ProgrammingRuby/html/tut_methods.html

