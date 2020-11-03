=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

- Understand the problem
  - Input
    - String
  - Output
    - New String in which every consonant character is doubled
  - Rules
    - Vowels, digits, punctuation, and whitespace should not be doubled.

- Examples
  - Covered

- Algorithm
  - Assign lower and uppercase consonants letters to `CONSONANTS`
  - Assign "" to `result`
  - Divide `input_string` into `characters`
  - iterate over `characters`
    - if current `char` is in `CONSONANTS`
      - add current two times to `result`
    - else
      - add one time
  - return `result`

- Code
=end

VOWELS = %w(a e i o u A E I O U)
CONSONANTS = ("A".."Z").to_a + ("a".."z").to_a - VOWELS

def double_consonants(string)
  result = ""
  
  string.chars.each do |char|
    if CONSONANTS.include?(char)
      result << char * 2
    else
      result << char
    end
  end

  result
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
