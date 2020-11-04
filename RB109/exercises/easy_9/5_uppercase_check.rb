=begin
Uppercase Check

Write a method that takes a string argument, and returns true if all of the 
alphabetic characters inside the string are uppercase, false otherwise. 
Characters that are not alphabetic should be ignored.

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

- Understand the problem
  - Input
    - String
  - Output
    - true/false
  - Rules
    - returns true if all of the alphabetic characters are uppercase, false 
      otherwise.
    - Characters that are not alphabetic should be ignored

- Examples
  - Covered

- Algorithm
  - assign upper case alphabet characters to `UPPER_ALPHABET`
  - split input `string` into `characters`
  - iterate over `characters`
    - assign upper case version of current `char` to `upper_char`
    - if current `upper_char` is not in `UPPER_ALPHABET`
      - do nothing
    - else
      - if current `char` is in `UPPER_ALPHABET`
        - do nothing
      - else
        - return false
  - return true

- Code
=end

UPPER_ALPHABET = ("A".."Z").to_a

def uppercase?(string)
  characters = string.chars

  characters.each do |char|
    next unless UPPER_ALPHABET.include?(char.upcase)

    return false unless UPPER_ALPHABET.include?(char)
  end

  true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
