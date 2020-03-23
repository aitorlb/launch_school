# Notes related to RB109 Topics:

### What is a Variable?
- A variable is simply a name for a value.
- It is helpful to think of variables as labeled containers that hold information.
- A variable is denoted by a name, and refers to an object, which is called the value of the variable. A variable itself is not an object.

#### Local variable

- A variable name denotes its scope (local, global, instance, etc.).
- A local variable is declared by starting the variable name with neither $ nor @, as well as not capitalizing the entire variable name.

#### Assigning Value to Variables
- When you assign a variable, you use the `=` symbol. The name of the variable goes on the left and the value you want to store in the variable goes on the right.
- An assignment statement doesn't create new objects, it sets the name on its left side (the lvalue) to refer to the value on the right (the rvalue). It then returns that value as the result of the assignment expression.
- What determines if objects are created during assignment is the value on the right side, which can be an arbitrary expresson.
- To refer to a value ultimatelly means to point to an object's address space in memory (#object_id)

#### Initialization vs Reassignment

- Local variables are created (initialized) the first time a value is assigned to them.
- Local variables are updated (reassigned) when a value is assigned to them if they were previously created.
- Local variables do not, like globals and instance variables, have the value `nil` before initialization.
- If you refer to an uninitialized local variable, `NameError` will be raised.

References:
https://docs.ruby-lang.org/en/2.4.0/syntax/assignment_rdoc.html
https://www.oreilly.com/library/view/the-ruby-programming/9780596516178/ch04s05.html
https://codecabulary.launchacademy.com/learn-ruby/barewords
https://codesliced.tumblr.com/post/49267721393/how-ruby-interprets-barewords