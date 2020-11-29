require 'pry'

=begin
Running Totals

Write a method that takes an Array of numbers, and returns an Array with the
same number of elements, and each element has the running total from the
original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

1. Understand the problem
- input
  - array of numbers
- output
  - array of numbers
- requirements
  - array of same size as original
  - each element has running total of original
  - example: original is [1,2,3] result is [1,3,6] 
  - handles empty arrays

2. Test cases

3. Describe your algorithm
  - create empty results array
  - iterate over original array
    - calculate sum up to current element (included)
    - add sum to array
  - return result array

4. Begin coding
=end

# def running_total(numbers)
#   results = []

#   numbers.reduce(0) do |sum, n|
#     results << sum += n
#     sum
#   end

#   results
# end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
