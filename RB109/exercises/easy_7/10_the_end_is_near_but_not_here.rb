require 'pry'

=begin
The End Is Near But Not Here

Write a method that returns the next to last word in the String passed to it as
an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

- Understand the problem
  - Input
    - A String
  - Output
    - A new String containing the next to last word in the input String.
  - Rules
    - Words are any sequence of non-blank characters.
    - The input String will always contain at least two words.

- Examples
  - Covered by examples

- Algorithm
  1. Split `input_string` into `words`
  2. Return next to last

- Code
=end

def penultimate(input_string)
  words = input_string.split
  words[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
