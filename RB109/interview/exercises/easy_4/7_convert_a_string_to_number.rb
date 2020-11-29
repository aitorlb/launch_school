require 'pry'

=begin
Convert a String to a Number!

The String#to_i method converts a string of numeric characters (including an
optional plus or minus sign) to an Integer. String#to_i and the Integer
constructor (Integer()) behave similarly. In this exercise, you will create a
method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number
 as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about
  invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. Your method should do this the old-fashioned
way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

1. Understand the problem
- input
  - string (of valid positive digits)
- output
 - positive integer
- rules
 - cannot use standad conversion methods like String#to_i, Integer(), etc.
 - calculate the result by analyzing the characters in the string

2. Test cases
string_to_number("1") == 1
string_to_number("123") == 123
string_to_number("2020") == 2020

3. Describe your algorithm
  - initialize result to 0
  - iterate over characters
  - identify digit character by using a hash, i.e. {"1"=>1}
  - identify digit value by its position (units, tens, hundreds, etc.)
  - add number to result
  - return result

4. Begin coding
=end

# def string_to_number(digits_str)
#   reversed_chars = digits_str.chars.reverse
#   result = 0

#   reversed_chars.each_with_index do |digit, index|
#     num = find_number(digit)
#     index.times { num *= 10 }
#     result += num
#   end

#   result
# end

DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_number(digits_str)
  digits_str.chars.reverse.each_with_index.reduce(0) do |sum, (digit, index)|
    num = find_number(digit)
    index.times { num *= 10 }
    sum += num
  end
end

def find_number(char)
  {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
  }[char]
end

puts string_to_number("1") == 1
puts string_to_number("123") == 123
puts string_to_number("2020") == 2020
