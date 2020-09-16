require 'pry'

=begin
Halvsies

Write a method that takes an Array as an argument, and returns two Arrays
(as a pair of nested Arrays) that contain the first half and second half of
the original Array, respectively. If the original array contains an odd number
of elements, the middle element should be placed in the first half Array.

Examples:

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

Understand the problem
- input: 1 Array of anything
- output: 1 Array containing 2 Arrays with the 1st and 2nd halves of the original Array
- rules:
  -  If the original array's size is odd, the middle element should be placed in the first half.

Test cases
- Well covered by examples

Describe Agorithm
- store size of array divided by two
- slice first half into new array
- slice second half into new array
- return array of two arrays

Begin coding
=end

def halvsies(array)
  half_size = array.size / 2
  half_size += 1 if array.size.odd?

  first_half  = array.take(half_size)
  second_half = array - first_half

  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]        # => true
p halvsies([1, 2, 3, 4])

puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]  # => true
p halvsies([1, 5, 2, 4, 3])

puts halvsies([5]) == [[5], []]                        # => true
p halvsies([5])

puts halvsies([]) == [[], []]                          # => true
