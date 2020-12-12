=begin
Counting Cats

Using the following code, create a class named Cat that tracks the number of 
times a new Cat object is instantiated. The total number of Cat instances 
should be printed when ::total is invoked.
=end

class Cat
  @@number_of_cats = 0

  def self.total
    puts @@number_of_cats
  end

  def initialize
    @@number_of_cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total # => 2

=begin
Discussion

Sometimes, certain data needs to be handled by the class itself, instead of 
instances of the class. That's where class variables come in. Class variables 
can be differentiated from instance variables by the double @@ prepended to 
their name.

In the solution, we use a class variable named number_of_cats to track the 
number of Cat instances. We're able to track this by incrementing 
@@number_of_cats each time a new object is instantiated. For each instance, 
#initialize will be invoked, which will in turn execute our statement that 
increments @@number_of_cats.

We can print the total number of Cat instances simply by invoking #puts on 
@@number_of_cats.
=end
