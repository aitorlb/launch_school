=begin
How long are you?

Write a method that takes a string as an argument, and returns an Array that 
contains every word from the string, to which you have appended a space and the 
word length.

You may assume that words in the string are separated by exactly one space, and 
that any substring of non-space characters is a word.

Examples:

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

- Understand the problem
  - Input
    - a String
  - Output
    - an Array of String elements
    - List contains every word from the string, to which you have appended a 
      space and the word length.
  - Rules
    - any substring of non-space characters is a word
    - words are separated by exactly one space

- Examples
  - Covered

- Algorithm
  - assign empty Array to `words_with_length`
  - separate input `string` into `words`
  - iterate over `words`
    - Add (current `word` + " " + `word` size) to `words_with_length`
  - return `words_with_length`

- Code
=end

def word_lengths(string)
  words_with_length = []
  words = string.split

  words.each do |word|
    words_with_length << "#{word} #{word.size}"
  end

  words_with_length
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

puts word_lengths("It ain't easy, is it?") ==
  ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
