require 'pry'

=begin
Fibonacci Numbers (Last Digit)

In the previous exercise, we developed a procedural method for computing the 
value of the nth Fibonacci numbers. This method was really fast, computing the 
20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit 
of the nth Fibonacci number.

Examples:

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

- Understand the problem
  - Input
    - Integer number
  - Output
    - Integer number
  - Rules
    - F(1) = 1
      F(2) = 1
      F(n) = F(n - 1) + F(n - 2) where n > 2

- Test cases
  - Covered by examples

- Algorithm
  Method: fibonacci, args: `n`
    - assign [0, 1] to `last_two_fibs`
    - iterate over 2 up to (`n` - 1)
      - assign last digit of sum of `last_two_fibs` to `current_fib`
      - pop first element of `last_two_fibs`
      - add `current_fib` to `last_two_fibs`
    - return last digit of sum of `last_two_fibs`

- Code
=end

def fibonacci_last(n)
  last_two_fibs = [0, 1]

  (2..(n - 1)).each do |number|
    current_fib = last_two_fibs.sum % 10
    last_two_fibs.shift
    last_two_fibs.push(current_fib)
  end

  last_two_fibs.sum % 10
end

puts fibonacci_last(15) == 0 # (15th Fibonacci number is 610)
puts fibonacci_last(20) == 5 # (20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5 # (100th Fib number is 354224848179261915075)
puts fibonacci_last(100_001) == 1 # (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3 # (this is a 208989 digit number)
puts fibonacci_last(123456789) == 4
