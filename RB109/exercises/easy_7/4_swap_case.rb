=begin
Swap Case

Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

You may not use String#swapcase; write your own version of this method.

Example:

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

- Understand the problem
  - Input
    - String
  - Output
    - String with cases swapped
  - Rules
    - All other characters should be unchanged.
    - You may not use String#swapcase

- Examples
  - Covered by examples

- Algorithm
  1. assign lower case alphabet to constant `LOWERCASE_ALPHABET`
  2. assign upper case alphabet to constant `UPPERCASE_ALPHABET`
  3. assign empty String to `result`
  3. split input_string into characters
  3. iterate over characters
    - if current_char is in `LOWERCASE_ALPHABET`
      - uppercase current_char
    - else if current_char is in `UPPERCASE_ALPHABET`
      - lowercase current_char
    - else
      - do nothing
    
    - append current_char to result
  4. return `result`

- Code
=end

LOWERCASE_ALPHABET = ("a".."z").to_a 
UPPERCASE_ALPHABET = ("A".."Z").to_a

# def swapcase(input_string)
#   result = ""

#   input_string.chars.each do |current_char|
#     if LOWERCASE_ALPHABET.include?(current_char)
#       current_char.upcase!
#     elsif UPPERCASE_ALPHABET.include?(current_char)
#       current_char.downcase!
#     end

#     result << current_char
#   end

#   result
# end

def swapcase(string)
  string
    .chars
    .map do |char|
      if LOWERCASE_ALPHABET.include?(char)
        char.upcase
      elsif UPPERCASE_ALPHABET.include?(char)
        char.downcase
      else
        char
      end
    end
    .join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
