=begin
Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of 
the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

- Understand the problem
  - Input
    - Array of anything
  - Output
    - New Array in which the first element is moved to the end of the array
  - Rules
    - Do not use the method Array#rotate or Array#rotate!
    - The original array should not be modified.

- Examples
  - Covered

- Algorithm
  - slice first element in Array and assign to `first`
  - slice Array from index 1 to end and assign to `rest`
  - return `rest` + `first`

- Code
=end

def rotate_array(array)
  first = array[0..0]
  rest  = array[1..-1]

  rest + first
end

def rotate_array(array)
  [*array[1..], array.first]
end

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
