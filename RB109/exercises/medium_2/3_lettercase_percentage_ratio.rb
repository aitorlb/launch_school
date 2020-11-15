 require 'pry'

=begin
Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number 
of uppercase and lowercase characters, as well as characters that were neither 
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 
entries: one represents the percentage of characters in the string that are 
lowercase letters, one the percentage of characters that are uppercase letters, 
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

letter_percentages('abCdef 123') ==
  { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') ==
  { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') ==
  { lowercase: 0, uppercase: 0, neither: 100 }


- Understand the problem
  - Input
    - String
      - Containing any characters.
  - Output
    - Hash
      - keys are :lowercase, :uppercase, :neither
      - values are the percentages of characters in the string of each type
  - Rules
    - The input String will always contain at least one character.

- Test cases
  - Covered by examples

- Algorithm
  Method: `letter_percentages`, args: `string`
    - assign lower case alphabet to `LOWER_ALPHABET`
    - assign upper case alphabet to `UPPER_ALPHABET`
    - assign Hash with :lowercase, :uppercase, :neither as keys and 0 as values
      to `results`
    - split `string` into characters and assign to `characters`
    - iterate over `characters` as `char`
      - if `char` is in `LOWER_ALPHABET`
        - add 1 to results[:lowercase]
      - elsif `char` is in `UPPER_ALPHABET`
        - add 1 to results[:uppercase]
      - else
        - add 1 to results[:neither]
    
    - transform values of `results`
      - divide value by number of characters in string and multiply by 100
      
- Code
=end

LOWER_ALPHABET = ("a".."z").to_a
UPPER_ALPHABET = ("A".."Z").to_a

def letter_percentages(string)
  results    = { lowercase: 0, uppercase: 0, neither: 0 }
  characters = string.chars

  characters.each do |char|
    if LOWER_ALPHABET.include?(char)
      results[:lowercase] += 1
    elsif UPPER_ALPHABET.include?(char)
      results[:uppercase] += 1
    else
      results[:neither] += 1
    end
  end
  
  results.transform_values do |value|
    (value.to_f / characters.size) * 100
  end
end

puts letter_percentages('abCdef 123') ==
  { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') ==
  { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') ==
  { lowercase: 0, uppercase: 0, neither: 100 }
