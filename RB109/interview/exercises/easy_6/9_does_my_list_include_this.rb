require 'pry'

=begin
Does My List Include This?

Write a method named include? that takes an Array and a search value as arguments.
This method should return true if the search value is in the array, false if it
is not. You may not use the Array#include? method in your solution.

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

Understand the problem
- input: 1 Array of anything and a search value
- output: Boolean
- rules:
  - return true if the search value is in the array, false otherwise.
  - You may not use the Array#include? method in your solution.

Test cases
- Well covered by examples

Describe Agorithm
- iterate over array
  - compare element to search value
  - return true if is equal
  - return false if none is equal

Begin coding
=end

def include?(array, search_value)
  array.any? { |element| element == search_value }
end

puts include?([1,2,3,4,5], 3) == true     # => true
puts include?([1,2,3,4,5], 6) == false    # => true
puts include?([], 3) == false             # => true
puts include?([nil], nil) == true         # => true
puts include?([], nil) == false           # => true

