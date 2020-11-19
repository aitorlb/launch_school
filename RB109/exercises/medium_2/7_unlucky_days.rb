 require 'pry'

=begin
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given 
by an argument. You may assume that the year is greater than 1752 (when the 
United Kingdom adopted the modern Gregorian Calendar) and that it will remain 
in use for the foreseeable future.

Examples:

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

- Understand the problem
  - Input
  - Output
  - Rules
    - The rule for leap years is:
      - exactly divisible by 4 AND NOT exactly divisible by 100
      - exactly divisible by 400

https://math.stackexchange.com/questions/59135/prove-that-every-year-has-at-least-one-friday-the-13th

- Test cases
  - Covered by examples

- Algorithm

- Code
=end
