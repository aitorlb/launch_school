# Notes on Special Topic of Interest for RB109:

## false vs nil and the idea of "truthiness"

In Ruby, every value apart from false and nil, evaluates to true in a boolean context. We can therefore say that in Ruby, every value apart from false and nil is truthy; we can also say that false and nil are falsey. This is not the same as saying every value apart from false and nil is true, or is equal to true. These may seem like subtle distinctions but they are important ones.

Example:

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

- "a is true and so 'Hello is truthy' is output" would be incorrect
- "a is equal to true and so 'Hello is truthy' is output" would be incorrect
- "a evaluates to true in the condtional statement and so 'Hello is truthy' is output" would be correct
- "a is truthy and so 'Hello is truthy' is output" would be correct

To sum up:

- Use "evaluates to true" or "is truthy" when discussing an expression that evaluates to true in a boolean context
- Do not use "is true" or "is equal to true" unless specifically discussing the boolean true
