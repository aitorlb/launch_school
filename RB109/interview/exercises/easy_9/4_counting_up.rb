=begin
Counting Up

Write a method that takes an integer argument, and returns an Array of all 
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater 
than 0.

Examples:

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

- Understand the problem
  - Input
    - Integer number
  - Output
    - Array of Integer numbers between 1 and the argument
  - Rules
    - Argument will always be a valid integer that is greater than 0.

- Examples
  - Covered

- Algorithm
  - assign empty Array to `numbers`
  - iterate an amount of times equal to input `number`
    - append `current_number` to `numbers`
  - return `numbers`

- Code
=end

def sequence(number)
  numbers = []

  (1..number).each do |current_number|
    numbers << current_number
  end

  numbers
end

def sequence(number)
  (1..number).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
