require 'pry'

=begin
Convert a String to a Signed Number!

In the previous exercise, you developed a method that converts simple numeric
strings to Integers. In this exercise, you're going to extend that method to
work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number
as an integer. The String may have a leading + or - sign; if the first character
is a +, your method should return a positive number; if it is a -, your method
should return a negative number. If no sign is given, you should return a
positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. You may, however, use the string_to_integer
method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

1. Understand the problem
- input
  - string (of valid digits)
- output
 - signed integer
- rules
 - cannot use standad conversion methods like String#to_i, Integer(), etc.
 - You may, however, use the string_to_integer method from the previous lesson.
 - work with signed numbers:
  - if the first character is a +, your method should return a positive number
  - if it is a -, your method should return a negative number.
  - If no sign is given, you should return a positive number.

2. Test cases
string_to_number("1") == 1
string_to_number("123") == 123
string_to_number("2020") == 2020

3. Describe your algorithm
  - take first character of string
  - find out if its a sign character (+ or -)
    - if it is:
      - identify sign character
      - convert rest of string to number
      - sum sign to number
    - else
      - convert whole of string to number
  - return number

4. Begin coding
=end

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

SIGN = {
  "+" => +1,
  "-" => -1,
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  sign = SIGN[string[0]]

  if sign
    string = string[1..]
    num = string_to_integer(string)
    num *= sign
  else
    num = string_to_integer(string)
  end
end

def string_to_signed_integer(string)
  sign = +1

  if SIGN[string[0]]
    sign   = SIGN[string[0]]
    string = string[1..]
  end

  string_to_integer(string) * sign
end

def string_to_signed_integer(string)
  case string[0]
  when '-'
    -string_to_integer(string[1..-1])
  when '+'
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
