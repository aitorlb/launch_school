require 'pry'
=begin
What Century is That?

Write a method that takes a year as input and returns the century. The return value should be a string that begins with
the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

1. Understand the problem
- input
 - a number
 - positive number?
- output
 - a sring
 - string should contain: the century number + st, nd, rd, or th as appropriate for that number.
- rules
  - New centuries begin in years that end with 01. i.e. 1901-2000 => 20th
    - century number to string
      - 1 st
      - 2 nd
      - 3 rd
      - 4 - 20 th => 11, 12, 13 are exceptions
      - 21 st
      - 22 nd
      - 23 rd
      - 24-30 th
      - 31 st
      - 32 nd
      - 33 rd
    - generalize
      - 1 => st (except 11th)
      - 2 => nd (except 12th)
      - 3 => rd (except 13th)
      - 4..9, 0 => th

2. Test cases
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
century(1100) == '10th'
century(1101) == '11th'
century(1200) == '11th'
century(1201) == '12th'
century(1300) == '12th'
century(1301) == '13th'

3. Describe your algorithm
- divide year by 100 and sum 1
- substract 1 if year ends with 00 
- return early with correct suffix if hundreds digits is: 11,12,13
- map last digit to correct suffix


4. Begin coding
=end

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
puts century(1100) == '11th'
puts century(1101) == '12th'
puts century(1200) == '12th'
puts century(1201) == '13th'
puts century(1300) == '13th'
puts century(1301) == '14th'