require 'pry'

=begin
Convert a Number to a String!

In the previous two exercises, you developed methods that convert simple numeric
strings to signed Integers. In this exercise and the next, you're going to
reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a
string representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
old-fashioned way and construct the string by analyzing and manipulating the
number.

Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

1. Understand the problem
- input
  - positive integer or zero
- output
 - string representation
- rules
 - cannot use standad conversion methods like Integer#to_s, String(), etc.

2. Test cases

3. Describe your algorithm
- create hash mapping number to string representation 
- turn integer into array of digits
- iterate over array of digits
  - find string representation for digit
  - append string representation to result
- return result

4. Begin coding
=end

STRINGS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
}

def integer_to_string(integer)
  digits = integer.digits.reverse

  digits.inject("") do |string, digit|
    string += STRINGS[digit]
  end
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
