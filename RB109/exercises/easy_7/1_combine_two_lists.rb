=begin
Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the elements
taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same
number of elements.

Example:

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

- Understand the problem
  - Input
    - 2 Arrays of any elements
  - Output
    - 1 Array containing all elements from both Array arguments
  - Rules
    - New Array has elements taken in alternation
    - both input Arrays are non-empty and have the same number of elements

- Examples
  - Covered

- Algorithm
  1. Assign empty array to ´result´
  2. Iterate over one array
    1. Add current value to ´result´
    2. Add current index value from other array to ´result´
  3. Return ´result´

- Code
=end

def interleave(array1, array2)
  result = []

  array1.each_with_index do |element, index|
    result << element
    result << array2[index]
  end

  result
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'] # true
