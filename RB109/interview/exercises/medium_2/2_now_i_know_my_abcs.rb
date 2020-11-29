require 'pry'

=begin
Now I Know My ABCs

A collection of spelling blocks has two letters per block, as shown in this 
list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do 
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be 
spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

- Understand the problem
  - Input
    - String
      - A word in upper and lower case.
  - Output
    - true/false
  - Rules
    - Can not use both letters from any given block.
    - Each block can only be used once.

- Test cases
  - Covered by examples

- Algorithm
  Method: `block_word?`, args: `word`
    - Assign Array of blocks (Array of 2 letters) to `BLOCKS`
    - uppercase `word` and assign to `upper_word`
    - split `upper_word` into characters and assign to `characters`
    - iterate over `blocks` as `first_letter`, `second_letter`
      - count how many times `first_letter` is in `characters` and assign to 
        `first_count`
      - count how many times `second_letter` is in `characters` and assign to 
        `second_count`
      - if `first_count` or `second_count` is more than 1 or both are 1
        - return false
      - else
        - do nothing
    - return true

- Code
=end

BLOCKS = [
  ["B", "O"],
  ["X", "K"],
  ["D", "Q"],
  ["C", "P"],
  ["N", "A"],
  ["G", "T"],
  ["R", "E"],
  ["F", "S"],
  ["J", "W"],
  ["H", "U"],
  ["V", "I"],
  ["L", "Y"],
  ["Z", "M"],
]

def block_word?(word)
  characters = word.upcase.chars

  BLOCKS.each do |first_letter, second_letter|
    first_count  = characters.count(first_letter)
    second_count = characters.count(second_letter)

    return false if (first_count > 1 || second_count > 1) ||
      (first_count == 1 && second_count == 1)
  end

  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
