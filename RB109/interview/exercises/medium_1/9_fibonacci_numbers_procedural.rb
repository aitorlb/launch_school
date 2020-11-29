require 'pry'

=begin
Fibonacci Numbers (Procedural)

In the previous exercise, we developed a recursive solution to 
calculating the nth Fibonacci number. In a language that is not 
optimized for recursion, some (not all) recursive methods can be 
extremely slow and require massive quantities of memory and/or 
stack space.

Ruby does a reasonably good job of handling recursion, but it 
isn't designed for heavy recursion; as a result, the Fibonacci 
solution is only useful up to about fibonacci(40). With higher 
values of nth, the recursive solution is impractical. (Our tail 
recursive solution did much better, but even that failed at 
around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a 
non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its 
results without recursion.

Examples:

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

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
      - assign sum of `last_two_fibs` to `current_fib`
      - pop first element of `last_two_fibs`
      - add `current_fib` to `last_two_fibs`
    - return sum of `last_two_fibs`

- Code
=end

def fibonacci(n)
  last_two_fibs = [0, 1]

  (2..(n - 1)).each do |number|
    current_fib = last_two_fibs.sum
    last_two_fibs.shift
    last_two_fibs.push(current_fib)
  end

  last_two_fibs.sum
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501
