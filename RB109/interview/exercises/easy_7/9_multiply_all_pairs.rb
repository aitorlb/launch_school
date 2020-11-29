require 'pry'

=begin
Multiply All Pairs

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every
pair of numbers that can be formed between the elements of the two Arrays. The
results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


- Understand the problem
  - Input
    - Two Array of numbers
  - Output
    - New Array of numbers that contains the product of every pair of numbers
      that can be formed between the elements of the two Arrays.
  - Rules
    - You may assume that neither argument is an empty Array.
    - The results should be sorted by increasing value.

- Examples
  - Covered by examples

- Algorithm
  1. Assign empty Array to `result`
  2. Iterate over `array_1`
    - Iterate over `array_2`
      - Multiply `current_number_array_1` with `current_number_array_2`
      - Add new number to `result`
  3. Sort `result` by increasing value.
  4. Return `result`

- Code
=end


def multiply_all_pairs(array_1, array_2)
  result = []

  array_1.each do |current_number_array_1|
    array_2.each do |current_number_array_2|
      result << current_number_array_1 * current_number_array_2
    end
  end

  result.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
