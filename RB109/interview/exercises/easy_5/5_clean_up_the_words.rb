require 'pry'

=begin
Clean up the words

Given a string that consists of some words (all lowercased) and an assortment of
non-alphabetic characters, write a method that returns that string with all of
the non-alphabetic characters replaced by spaces. If one or more non-alphabetic
characters occur in a row, you should only have one space in the result (the
result should never have consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '

Understand the problem
  - input
    - string
      - some words (all lowercased)
      - and an assortment of non-alphabetic characters
  - output
    - string
      - same string with all of the non-alphabetic characters replaced by spaces
  - rules
    - the result should never have consecutive spaces
      - consecutive non-alphabetic characters get replaced by one space

Test cases
  - Well covered by examples

Describe algorithm
  - create array of alphabetic chars
  - split string into of words words
  - create array of transformed words
    - iterate over words
      - iterate over chars of current word
        - if character alphabetic
          - return character
        - else
          - return space " "
      - strip resulting word
  - join array of new words

Begin coding
=end

ALPHABET = ("a".."z").to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << " " unless clean_chars.last == " "
    end
  end

  clean_chars.join
end

puts cleanup("---what's my +*& line?") == ' what s my line '
