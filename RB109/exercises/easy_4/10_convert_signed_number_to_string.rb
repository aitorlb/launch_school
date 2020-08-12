require 'pry'

=begin
Convert a Signed Number to a String!

In the previous exercise, you developed a method that converts non-negative
numbers to strings. In this exercise, you're going to extend that method by
adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. You may, however, use
integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

1. Understand the problem
- input
  - signed integer or zero
- output
 - string representation
- rules
 - cannot use standad conversion methods like Integer#to_s, String(), etc.
  - You may use integer_to_string from the previous exercise.

2. Test cases

3. Describe your algorithm
- if integer is negative
  - convert integer to positive
  - pass integer to integer_to_string
  - prepend - sign to string
- else
  - pass integer to integer_to_string


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

def signed_integer_to_string(integer)
  case
  when integer.zero?
    integer_to_string(integer)
  when integer.negative?
    "-" + integer_to_string(-integer)
  else
    "+" + integer_to_string(integer)
  end
end

def signed_integer_to_string(integer)
  sign   = ""

  case
  when integer.negative?
    integer *= -1
    sign = "-"
  when integer.positive?
    sign = "+"
  end

  sign + integer_to_string(integer)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
