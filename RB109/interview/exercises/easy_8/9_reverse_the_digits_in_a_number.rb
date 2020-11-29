=begin
Reverse the Digits In a Number

Write a method that takes a positive integer as an argument and returns that
mumber with its digits reversed.

Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

- Understand the problem
  - Input
    - Integer number
  - Output
    - New Integer number with digits reversed
  - Rules
    - Integer is positive
    - No leading zeros in return value!

- Examples
  - Covered

- Algorithm
  - split number into Array of digits
  - reverse Array
  - join Array
  - Convert to String

- Code
=end

def reversed_number(number)
  number
    .to_s
    .chars
    .reverse
    .join
    .to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
