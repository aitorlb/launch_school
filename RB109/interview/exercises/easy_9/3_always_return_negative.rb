=begin
Always Return Negative

Write a method that takes a number as an argument. If the argument is a 
positive number, return the negative of that number. If the number is 0 or 
negative, return the original number.

Examples:

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

- Understand the problem
  - Input
    - A number
  - Output
    - A number
  - Rules
    - If the argument is a positive number, return the negative of that number. 
    - If the number is 0 or negative, return the original number.

- Examples
  - Covered

- Algorithm
  - If input `number` is less than or equal to 0
    - return `number`
  - else
    - return negative `number`

- Code
=end

def negative(number)
  if number <= 0
    number
  else
    -number
  end
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby
