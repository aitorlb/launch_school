require 'pry'

=begin
Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each letter.
The non-alphabetic characters should still be included in the return value; they
just don't count when toggling the desired case.

Example:

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


- Understand the problem
  - Input
    - String
  - Output
    - New String with staggered capitalization
  - Rules
    - every other char is capitalized (odds) and remaining chars are lowercase.
    - non-letter characters should NOT be changed and should NOT be counted.

- Examples
  - Covered by examples

- Algorithm
  1. assign upper and lowercase alphabet to `LETTERS`
  2. assign empty sring to `result`
  3. assign 0 to `letter_counter`
  4. split `input_string` into Array of characters
  5. iterate over `characters`
    - if `current_char` is in `LETTERS`
      - increment `letter_counter` by 1
      - if `letter_counter` is odd
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

def staggered_case(input_string)
  result = ""
  letter_counter = 0

  characters = input_string.split("") # .chars

  characters.each.with_index(1) do |current_char, current_index|
    if LETTERS.include?(current_char)
      letter_counter += 1

      if letter_counter % 2 == 0 # .even?
        current_char.downcase!
      else
        current_char.upcase!
      end
    end

    result << current_char
  end

  result
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
