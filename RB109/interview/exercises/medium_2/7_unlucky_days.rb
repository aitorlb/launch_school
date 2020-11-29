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

Hint:

Ruby's Date class may be helpful here.

- Understand the problem
  - Input
    - Integer
  - Output
    - Integer
  - Rules
    - returns the number of Friday the 13ths in the year given
    - You may assume that all given years use the Gregorian Calendar

- Test cases
  - Covered by examples

- Algorithm
  Method: `friday_13th`, args: `year`
    - assign 0 to `friday_13th_count`
    - assign Array with integers from 1 to 12 to `MONTHS`
    - Iterate over `MONTHS` as `month`
      - Initialize Date object with year, month and 13 (as day) and assign to
        `date`.
      - if date is friday?
        - increment `friday_13th_count`
      - else
        - do nothing
    - return `friday_13th_count`

- Code
=end

require 'date'
require 'pry'

MONTHS = (1..12).to_a

# def friday_13th(year)
#   friday_13th_count = 0

#   MONTHS.each do |month|
#     date = Date.new(year, month, 13)

#     friday_13th_count += 1 if date.friday?
#   end

#   p friday_13th_count
# end

def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
