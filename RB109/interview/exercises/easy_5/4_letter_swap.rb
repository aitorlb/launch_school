=begin
Letter Swap

Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

You may assume that every word contains at least one letter, and that the
string will always contain at least one word. You may also assume that each
string contains nothing but words and spaces

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Understand problem
  - input
    - string
      - of words separated by spaces
      - the string contains at least one word
      - every word contains at least one letter
  - output
    - string
      - same string of words BUT
      - the first and last letters of every word are swapped.
  - rules

Test cases
  - Well covered by examples.

Describe algorithm
  - split string into array of words
  - create array of transformed words
    - iterate over words (transform)
      - iterate over charactars of current word
      - get first character
      - get last character
      - get middle of word (rest)
      - return word with first and last character swapped
        - last + middle + first
  - join array of transformed words

Begin coding
=end

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end

def swap(words_str)
  words = words_str.split

  new_words = words.map do |word|
    next word if word.chars.one?

    first  = word[0]
    last   = word[-1]
    middle = word[1..-2]

    last + middle + first
  end

  new_words.join(" ")
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
