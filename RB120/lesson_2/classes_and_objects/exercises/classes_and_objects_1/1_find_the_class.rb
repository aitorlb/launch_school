=begin
Find the Class

Update the following code so that, instead of printing the values, each 
statement prints the name of the class to which it belongs.

puts "Hello"
puts 5
puts [1, 2, 3]
=end

puts "Hello".class    # => String
puts 5.class          # => Integer
puts [1, 2, 3].class  # => Array

=begin
Discussion

All values in the example are objects. Each object is an instance of a class: 
"Hello is a String, 5 is an Integer, and [1, 2, 3] is an Array.

To find the class an object belongs to, we invoke the #class method.
=end
