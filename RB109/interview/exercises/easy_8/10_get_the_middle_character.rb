=begin
Get The Middle Character

Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length, you
should return exactly one character. If the argument has an even length, you
should return exactly two characters.

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

- Understand the problem
  - Input
    - a non-empty String
  - Output
    - A new String containing the middle character or characters of the argument
  - Rules
    - If the argument has an odd length, you should return one character
    - If the argument has an even length, you should return two characters

- Examples
  - Covered

- Algorithm
  - Assign length of input `string` to `length`
  - Assign length / 2 to `half_point`
  - if length is odd
    - return element at index `half_point`
  - else
    - return substring from `half_point` - 1 to `half_point`

- Code
=end

def center_of(string)
  length = string.length
  half_point = length / 2

  if length.odd?
    string[half_point]
  else
    string[(half_point - 1)..half_point]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
