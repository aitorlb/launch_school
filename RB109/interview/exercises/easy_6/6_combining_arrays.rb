require 'pry'

=begin
Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in
the original Arrays.

Example

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Understand the problem
- input: 2 Arrays of anything
- output: 1 Array containing all of the values from the 2 Arrays
- rules:
  -  There should be no duplication of values in the returned Array

Test cases
- Well covered by examples

Describe Agorithm
- 

Begin coding
=end

def merge(array1, array2)
  [*array1, *array2].uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9] # => true
