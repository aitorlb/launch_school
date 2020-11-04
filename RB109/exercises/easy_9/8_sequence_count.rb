=begin
Sequence Count

Create a method that takes two integers as arguments. The first argument is a 
count, and the second is the first number of a sequence that your method will 
create. The method should return an Array that contains the same number of 
elements as the count argument, while the values of each element will be 
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or 
greater, while the starting number can be any integer value. If the count is 0, 
an empty list should be returned.

Examples:

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

- Understand the problem
  - Input
    - 2 Integer numbers
      - a count
      - first number
  - Output
    - Array of numbers
  - Rules
    - count argument will always have a value of 0 or greater
    - starting number can be any integer value (positive and negative)
    - If the count is 0, an empty list should be returned.
    - Array contains the same number of elements as the count argument
    - Array elements are multiples of the starting number
    
- Examples
  - Covered

- Algorithm
  - assign empty Array to `multiples`
  - if `count` is eq to 0
    - return `multiples`
  - else
    - loop `count` times
      - add current `number` times `first_number` to `multiples`
  - return `multiples`

- Code
=end

def sequence(count, first_number)
  multiples = []

  return multiples if count.zero?
  
  (1..count).each do |number|
    multiples << number * first_number
  end

  multiples
end

def sequence(count, first_number)
  (1..count).map { |num| first_number * num }
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
