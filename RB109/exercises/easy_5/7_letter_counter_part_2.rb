=begin
Letter Counter (Part 2)

Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Examples

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

Understand problem
  - input
    - string
      - words separated by spaces
      - words contain no spaces
  - output
    - hash
      - word size count. "hello world" { 3 => 2 }
  - rules
    - exclude non-letters when determining word size. "hello world!" { 3 => 2 }

Test cases
  - well covered by examples.

Describe algorithm
  - initialize alphabet constant
  - modify Arrat#each block
    - select chars from word that appear in alpgabet
    - calculate size from parsed word
  - return hash

Begin coding
=end

ALPHABET = ("a".."z").to_a

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    stripped_word = word.chars.select { |c| ALPHABET.include?(c.downcase) }.join 
    counts[stripped_word.size] += 1
  end
  counts
end

# LS Solution
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

=begin
Further Exploration

String#delete

Returns a copy of str with all characters in the intersection of its arguments
deleted. Uses the same rules for building the set of characters as String#count.

"hello".delete "l","lo"        #=> "heo"
"hello".delete "lo"            #=> "he"
"hello".delete "aeiou", "^e"   #=> "hell"
"hello".delete "ej-m"          #=> "ho"

String#count

Each other_str parameter defines a set of characters to count. The intersection
of these sets defines the characters to count in str. Any other_str that starts
with a caret ^ is negated. The sequence c1-c2 means all characters between c1
and c2. The backslash character \ can be used to escape ^ or - and is otherwise
ignored unless it appears at the end of a sequence or the end of a other_str.

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4
=end
