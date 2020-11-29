require 'pry'

=begin
Multiply Lists

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

Examples:

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


- Understand the problem
  - Input
    - Two Array of numbers 
  - Output
    - New Array of numbers containing the product of each pair of numbers from
      the arguments that have the same index.
  - Rules
    - You may assume that the arguments contain the same number of elements.

- Examples
  - Covered by examples

- Mental model
  - 

- Algorithm
  1. Assign empty Array to `result`
  2. Iterate over `array_1`
    - Multiply `current_number` with number with same index in `array_2`
    - Add multipication to `result`
  3. Return result

- Code
=end

def multiply_list(array_1, array_2)
  result = []

  array_1.each_with_index do |current_number, current_index|
    result << current_number * array_2[current_index]
  end

  result
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]



