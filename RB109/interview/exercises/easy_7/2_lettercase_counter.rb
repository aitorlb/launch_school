=begin
Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters,
and one the number of characters that are neither.

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


- Understand the problem
  - Input
    - String
  - Output
    - Hash with 3 entries: lowercase count, uppercse count, neither count.
  - Rules
    - Input String can be empty
    - Input String can ontain symbols, numbers and spaces

- Examples
  - Covered by examples

- Algorithm
  1. assign lower case alphabet to constant `LOWERCASE_ALPHABET`
  2. assign upper case alphabet to constant `UPPERCASE_ALPHABET`
  3. Assign Hash with expected keys and value 0 to `result`
  4. iterate over input string
    - if current character is in `LOWERCASE_ALPHABET`
      - increment :lowercase entry
    - else if current character is in `UPPERCASE_ALPHABET`
      - increment :uppercase entry
    - else
      - increment :neither entry
  5. Return `result`

- Code
=end

LOWERCASE_ALPHABET = ("a".."z").to_a 
UPPERCASE_ALPHABET = ("A".."Z").to_a

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if LOWERCASE_ALPHABET.include?(char)
      result[:lowercase] += 1
    elsif UPPERCASE_ALPHABET.include?(char)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
