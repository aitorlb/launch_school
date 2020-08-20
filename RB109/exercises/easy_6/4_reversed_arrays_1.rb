require 'pry'

=begin
Reversed Arrays (Part 1)
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

Understand the problem
- input: Array of anything
- output: Same Array of anything reversed
- rules:
  - the method should reverse the elements in place.
  - The return value
should be the same Array object.

Test cases
- Well covered by examples

Describe Agorithm
- iterate over array elements to half point
  - assign element at index element.size element - current index to block variable `end_element`
  - assign element at current index to block variable `start_element`
  - swap `start_element` and `end_element`

Begin coding
=end

def reverse!(array)
  index      = 0
  half_point = array.size / 2

  while index < half_point
    end_index     = array.size - index - 1
    end_element   = array[end_index]
    start_element = array[index]

    array[index]     = end_element
    array[end_index] = start_element

    index += 1
  end
  
  array
end

list = [1,2,3,4]
puts list.object_id
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id
p result
p list

list = %w(a b e d c)
result = reverse!(list)
puts result == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]
puts list.object_id == result.object_id

list = ['abc']
result = reverse!(list)
puts result == ["abc"]
puts list == ["abc"]
puts list.object_id == result.object_id

list = []
result = reverse!(list)
puts result == []
puts list == []
puts list.object_id == result.object_id
