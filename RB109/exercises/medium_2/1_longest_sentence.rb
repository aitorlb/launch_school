require 'pry'

=begin
Longest Sentence

Write a program that reads the content of a text file and then prints the 
longest sentence in the file based on number of words. Sentences may end with 
periods (.), exclamation points (!), or question marks (?). Any sequence of 
characters that are not spaces or sentence-ending characters should be treated 
as a word. You should also print the number of words in the longest sentence.

Example text:

Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words 
long. (Note that each -- counts as a word.)

Another Example

Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run 
your program on this file.

The longest sentence in this book is 157 words long.

- Understand the problem
  - Input
    - text file
  - Output
    - prints the longest sentence in the file based on number of words
  - Rules
    - Sentences may end with periods (.), exclamation points (!), or question 
      marks (?)
    - Any sequence of characters that are not spaces or sentence-ending   
      characters should be treated as a word.
    - You should also print the number of words in the longest sentence.

- Test cases
  - Covered by examples

- Algorithm
  Method: `longest_sentence`, args: text
    - Assign ".", "!", "?" to SENTENCE_DELIMITERS
    - Assign " ", "\n" to WORD_DELIMITERS
    - Split text using SENTENCE_DELIMITERS into `sentences`
    - sort `sentences` by size
    - assign last element in `sentences` to `longest_sentence`
    - split `longest_sentence` using WORD_DELIMITERS and assign to `words`
    - reject empty characters from `words` Array
    - Print
      - "The longest sentence in this book is: "#{longest_sentence}"
      - "The longest sentence in this book is #{words.size} words long."

- Code
=end

SENTENCE_DELIMITERS = [".", "!", "?"]
WORD_DELIMITERS = [" ", "\n"]

def longest_sentence(text)
  sentences = text.split(Regexp.union(SENTENCE_DELIMITERS))
  longest_sentence = sentences.sort_by(&:size).last.strip
  words = longest_sentence.split(Regexp.union(WORD_DELIMITERS)).reject(&:empty?)

  puts "The longest sentence in this book is: \n\n#{longest_sentence}\n\n"
  puts "The longest sentence in this book is #{words.size} words long."
end

text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

longest_sentence(text)

p84 = File.read("pg84.txt")

longest_sentence(p84)

