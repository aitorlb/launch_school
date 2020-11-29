=begin
Letter Counter (Part 1)

Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == {
  3 => 5, 6 => 1, 7 => 2
}
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

Understand problem
  - input
    - string
      -  one or more space separated words
      - Words consist of string of characters that do not include a space.
  - output
    - hash
      - shows the number of words of different sizes

Test cases
  - well covered by examples.

Describe algorithm
  - turn string into array (split at " ")
  - initalize empty hash
  - iterate over array of words
    - calculate size of current word
    - if hash has word size as key
      - add one to value as word count
    - else
      - assign word_size => 1 to hash
  - return hash

Begin coding
=end

def word_sizes(words_str)
  word_sizes_count = {}

  words_str.split.each do |word|
    if word_sizes_count.key?(word.size)
      word_sizes_count[word.size] += 1
    else
      word_sizes_count[word.size] = 1
    end
  end
  
  word_sizes_count
end

def word_sizes(words_str)
  word_by_size = words_str.split.group_by { |w| w.size }
  word_by_size.map { |size, words| [size, words.count] }.to_h
end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == {
  3 => 5, 6 => 1, 7 => 2
}
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
