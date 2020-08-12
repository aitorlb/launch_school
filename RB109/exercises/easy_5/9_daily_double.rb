=begin
ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze
or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

Understand the problem
  - input: string
    - string containing characters (without spaces)
  - output: string
    - string without duplicate characters

Test cases
  - well covered by examples

Describe algorithm
  - initialize empty array
  - iterate over characters in word
    - add current character to array
    - unless last character in array is equal to current word
  - join array
  - return array

Begin coding
=end

def crunch(word)
  chars = []

  word.chars.each { |c| chars << c unless chars.last == c }
  
  chars.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
