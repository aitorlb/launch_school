require 'pry'

=begin
Staggered Caps (Part 1)

Write a method that takes a String as an argument, and returns a new String that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized, and the remaining characters are lowercase.
Characters that are not letters should not be changed, but count as characters
when switching between upper and lowercase.

Example:

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


- Understand the problem
  - Input
    - String
  - Output
    - New String with staggered capitalization
  - Rules
    - every other char is capitalized (odds) and remaining chars are lowercase.
    - non-letter characters should not be changed, but should be counted.

- Examples
  - Covered by examples

- Algorithm
  1. assign upper and lowercase alphabet to `LETTERS`
  2. assign empty sring to `result`
  3. split `input_string` into Array of characters
  3. iterate over `characters`
    - if `current_char` is in `LETTERS`
      - if `current_index` is odd
        - upcase `current_char`
      - else
        - downcase `current_char`
    - else 
      do nothing
    
    - Add `current_char` to `result`
  4. Return `result`

- Code
=end

LETTERS = ("A".."Z").to_a + ("a".."z").to_a

# def staggered_case(input_string)
#   result = ""

#   characters = input_string.split("") # .chars

#   characters.each.with_index(1) do |current_char, current_index|
#     if LETTERS.include?(current_char)
#       if current_index % 2 == 0 # .even?
#         current_char.downcase!
#       else
#         current_char.upcase!
#       end
#     end

#     result << current_char
#   end

#   result
# end

def staggered_case(string)
  string
    .chars
    .map
    .with_index(1) do |char, idx|
      if LETTERS.include?(char)
        idx.odd? ? char.upcase : char.downcase
      else
        char
      end
    end
    .join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
