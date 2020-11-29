require 'pry'

=begin
Multiples of 3 and 5

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20, the result
should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Examples

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
multisum(20) == 98

1. Understand the problem
- input
 - positive number
- output
 - positive number
- requirements
  - searches for all multiples of 3 or 5 that lie between 1 and some other number
  - computes the sum of those multiples
- rules
  - multiples of n == evenly divisible by n (no remainder when divided by n)

2. Test cases

3. Describe your algorithm
- empty array
- iterate over range 1..n
- if element if multiple of 3 or 5
    - add to array
  -else
    - do nothing
- return sum of array elements

4. Begin coding
=end

# def multisum(num)
#   multiples = []

#   (1..num).each do |n|
#     multiples << n if (n % 3 == 0) || (n % 5 == 0)
#   end

#   multiples.sum
# end

# def multisum(num)
#   (1..num).select { |n| (n % 3 == 0) || (n % 5 == 0) }.sum
# end

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(num)
  (1..num).inject(0) do |sum, n|
    sum += n if multiple?(n, 3) || multiple?(n, 5)
    sum
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(20) == 98
