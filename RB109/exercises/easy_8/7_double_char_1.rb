=begin
Double Char (Part 1)

Write a method that takes a string, and returns a new string in which every
character is doubled.

Examples:

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

- Understand the problem
  - Input
    - String
  - Output
    - New String in which every character is doubled

- Examples
  - Covered

- Algorithm
  - Assign "" to `result`
  - Divide `input_string` into `characters`
  - iterate over `characters`
    - add current `char` two times to `result`
  - return `result`

- Code
=end

def repeater(string)
  result = ""

  string.chars.each do |char|
    result << char * 2
  end

  result
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
