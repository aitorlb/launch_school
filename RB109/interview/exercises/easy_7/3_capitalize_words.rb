=begin
Capitalize Words

Write a method that takes a single String argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

- Understand the problem
  - Input
    - String
  - Output
    - String with the first character of every word capitalized and all other letters lowercase.
  - Rules
    - Words are any sequence of non-blank characters (separated by spaces).

- Examples
  - Covered by examples

- Algorithm
  1. Assign empty Array to `result`
  2. Split input string into words (use blank character as delimiter)
  3. Iterate over words
    - Capitalize current word
    - Append capitalized word to `result`
  4. Convert `result` Array into String and separate elements with a space.
  5. Return `result` String 

- Code
=end

# def word_cap(input_string)
#   result = []

#   input_string.split(' ').each do |current_word|
#     result << current_word.capitalize
#   end

#   result.join(' ')
# end

def word_cap(words)
  words
    .split
    .map(&:capitalize)
    .join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
