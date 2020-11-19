 require 'pry'

=begin
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of 
the first n positive integers and the sum of the squares of the first n 
positive integers.

Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

- Understand the problem
  - Input
    - positive Integer
  - Output
    - positive Integer or zero
  - Rules
    - computes the difference between:
      - the square of the sum of the first n positive integers (from 1 up to n)
      - and the sum of the squares of the first n positive integers.

- Test cases
  - Covered by examples

- Algorithm
  Method `sum_square_difference`, args: `n`
    - assign Array of integers from 1 up to `n` to `inegers`
    - assign square of sum of `integers` to `square_of_sum`
    - assign sum of squares of `integers` to `sum_of_squares`
    - return `square_of_sum` - `sum_of_squares`
    
- Code
=end

def sum_square_difference(n)
  integers = (1..n).to_a

  square_of_sum  = integers.sum ** 2
  sum_of_squares = integers.map { |n| n ** 2 }.sum

  square_of_sum - sum_of_squares
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
