# Notes on topic:

## How passing an object into a method definition can or cannot permanently change the object

- Local variables passed into methods as arguments are being assigned to parameters so they reference the same object.
- Since variables values are references to an object, it is possible that a method may modify the contents of a mutable object passed into it.

#### Mutation

- You can invoke methods in objects passed to methods to change the object’s state.

```ruby
def append(string)
  string << '!'
end

s = 'hi'
append(s)
puts s
```

Method `append` is defined with a parameter `string` and in its body the method `String#<<` is called on object referenced by `string` with the String `'!'` passed to it as argument.

Variable `a` is initialized and assigned to the String `'hi'`.

Method `append` is called with variable `s` passed to it as argument.

The `Kernel#puts` method is called with the variable `s` passed to it as an argument, which outputs `'hi!'`. Because method parameter `string` points to the same object as local variable `s`, and `String#<<` is a destructive method that mutates the object, both variables reflect the new object state.


- In mutation, the value of an object changes but its identity remains the same:

```ruby
variable = "abc"
# => "abc"
old_variable_object_id = variable.object_id
# => 70334336923120
variable << "def"
# => "abcdef"
new_variable_object_id = variable.object_id
# => 70334336923120
old_variable_object_id == new_variable_object_id
# => true
```
#### Reassignment

- You can invoke methods in objects passed to methods to change the object’s state.
- ReassignmentMutating an object will be reflected in all variables that point to it.

```ruby
def reassign(string)
  string += '!' # string = string + '!''
end

s = 'hi'
reassign(s)
puts s
```

Method `reassign` is defined with a parameter `string` and in its body `string` is reassigned to the return value of the method `String#+` being called on object referenced by `string` with the String `'!'` passed to it as argument.

Variable `a` is initialized and assigned to the String `'hi'`.

Method `reassign` is called with variable `s` passed to it as argument.

The `Kernel#puts` method is called with the variable `s` passed to it as an argument, which outputs `'hi'`. Because method parameter `string` points to the same object as local variable `s`, but `String#+` is a non-destructive method that produces a new String, both variables end up referring to different objects with different states.

- In reassignment, the variable can point to a new object, while he old object remains unchanged:

```ruby
variable = "abc"
# => "abcdef"
old_variable_object_id = variable.object_id
# => 70352878923600
variable += "def"
# => "abcdef"
new_variable_object_id = variable.object_id
# => 70352866744560
old_variable_object_id == new_variable_object_id
# => false
```

References:
https://medium.com/@AdamLombard/easy-ruby-plus-equals-vs-shovel-6f030875e366
https://thoughtbot.com/upcase/videos/mutation-in-ruby
