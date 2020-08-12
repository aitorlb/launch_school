=begin
Write a method that takes a string input, and returns the first character that 
is not repeated anywhere in the string.

For example, if given the input 'stress', the method should return 't', since
the letter 't' only occurs once in the string, and occurs first in the string.

Upper- and lowercase letters are considered the same character, but the method 
should return the correct case for the initial letter. For example, the input
'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return an empty string ("")


Examples

p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('sTreSS') == 'T'
p first_non_repeating_letter('moonmen') == 'e'
p first_non_repeating_letter('aabbcc') == ''
p first_non_repeating_letter('') == ''

Understand problem
  - input
    - string (empty or not, lower and upper case characters)
  - output
    - string character
  - rules
    - returns the FIRST character that is not repeated anywhere in the string.
    - Upper and lowercase letters are considered the same character.
    - return the CORRECT CASE for the initial letter
    - return an empty string ("") if string contains all repeating characters

Test cases
  - well covered by examples
  
Describe Algorith
  - create array of characters in string
  - iterate over characters
    - initialize count
    - iterate over characters again
      - check if current character (outer loop) is same as current char (inner loop)
      - add one to count if repeated
    - return character if count is 1
      
Begin coding
=end

def first_non_repeating_letter(string)
  chars = string.chars
  
  repeated_char = chars.find do |char|
    chars.select { |c| c.downcase == char.downcase }.one?
  end
  
  repeated_char || ""
end

p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('sTreSS')# == 'T'
p first_non_repeating_letter('moonmen') #== 'e'
p first_non_repeating_letter('aabbcc') == ''
p first_non_repeating_letter('') == ''
