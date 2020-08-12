require 'pry'

=begin
Leap Years (Part 2)
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years
occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine
leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

1. Understand the problem
- input
 - positive number
- output
 - boolean
- requirements
  - return true if leap year, false otherwise.
- rules
  - evenly divisible by n == no remainder when divided by n
  - IS leap year if evenly divisible by 4 AND before 1752
  - IS leap year if evenly divisible by 4 AND NOT evenly divisible by 100
  - IS leap year if evenly by 400 AND NOT evenly divisible by 100

2. Test cases

3. Describe your algorithm
- return true if less than 1752 and divisible by 4
- return true if evenly divisible by 400
- return false if evenly divisible by 100
- check if evenly divisible by 4

4. Begin coding
=end

def leap_year?(year)
  if year < 1752 && year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# def leap_year?(year)
#   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
# end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
