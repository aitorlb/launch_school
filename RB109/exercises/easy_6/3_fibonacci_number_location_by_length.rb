require 'pry'

=begin
Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number is
the sum of the two previous numbers. This series appears throughout the natural
world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. (The first
Fibonacci number has index 1.)

Examples:

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

You may assume that the argument is always greater than or equal to 2.

Understand the problem
- input: Integer representing the number of digits of a Fibonacci number
- output: Integer representing the index of the first Fibonacci number
- rules:
  - The first Fibonacci number has index 1.
  - You may assume that the argument is always greater than or equal to 2.

Test cases
- Well covered by examples

Describe Agorithm
- assign `13` to `current_fib_number` variable
- assign `[1, 1, 2, 3, 5, 8, 13]` to `fib_numbers` variable 
- while `current_fib_number.digits.count` is less than argument
  - compute next fibonacci number
  - add next fibonacci number to `fib_numbers` variables
  - assign last `fib_numbers` to `current_fib_number`
- return index of `current_fib_number` in `fib_numbers`

Begin coding
=end

# Approach 1: Storing all Fibonacci numbers

def find_fibonacci_index_by_length(length)
  fib_numbers        = [1, 1, 2, 3, 5, 8, 13]
  current_fib_number = fib_numbers.last

  while length > current_fib_number.digits.count
    fib_numbers << compute_next_fib_number(fib_numbers)
    current_fib_number = fib_numbers.last
  end

  fib_numbers.size # The first Fibonacci number has index 1
end

def compute_next_fib_number(fib_numbers)
  current_fib_num_index  = fib_numbers.size - 1
  previous_fib_num_index = current_fib_num_index - 1
  fib_numbers[previous_fib_num_index..current_fib_num_index].sum
end

# Approach 1: Storing only 3 Fibonacci numbers at a time

# You may assume that the argument is always greater than or equal to 2.
INITIAL_SEQUENCE = [8, 13]
INITIAL_INDEX    = 7

def find_fibonacci_index_by_length(length)
  fib_numbers        = INITIAL_SEQUENCE
  current_index      = INITIAL_INDEX
  current_fib_number = fib_numbers.last

  debug_array = [1, 1, 2, 3, 5, 8, 13]

  while length > current_fib_number.size
    fib_numbers        = compute_fib_numbers(fib_numbers)
    current_index      += 1
    current_fib_number = fib_numbers.last

    debug_array << current_fib_number
  end

  puts "length: #{length}; current_fib_number: #{current_fib_number}; index: #{current_index}"
  puts "================="
  p debug_array
  puts "================="
  current_index
end

def compute_fib_numbers(fib_numbers)
  fib_numbers << fib_numbers.sum
  fib_numbers.shift
  fib_numbers
end

# p find_fibonacci_index_by_length(2)
# p find_fibonacci_index_by_length(3)

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
# puts find_fibonacci_index_by_length(100) == 476
# puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847
