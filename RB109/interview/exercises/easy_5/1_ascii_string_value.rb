require 'pry'

=begin
ASCII String Value

Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument. The ASCII string value is the sum of the ASCII
values of every character in the string. (You may use String#ord to determine
the ASCII value of a character.)

Examples:

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

1. Understand problem
- input
  - string (empty or not)
- output
  - integer (positive)
- rules
  - The ASCII string value is the sum of the ASCII value of every character
  - You may use String#ord to determine the ASCII value of a character.

2. Test cases

3. Describe algorithm
- initialize result variable to 0
- convert string to array of characters
- iterate over array
  - determine ASCII value of character using String#ord
  - add ASCII value to result
- return result

4. Begin coding
=end

def ascii_value(string)
  string.chars.reduce(0) { |result, char| result += char.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

=begin
Further Exploration

Integer#chr
Returns a string containing the character represented by the int's value
according to encoding. Uses ASCII encoding by default.
=end
