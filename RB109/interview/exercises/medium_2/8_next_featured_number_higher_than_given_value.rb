=begin
Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is 
a multiple of 7, and whose digits occur exactly once each. So, for example, 49 
is a featured number, but 98 is not (it is not odd), 97 is not (it is not a 
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the 
next featured number that is greater than the argument. Issue an error message 
if there is no next featured number.

Examples:

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those 
requirements

- Understand the problem
  - Input
    - Integer
  - Output
    - Integer
  - Rules
    - Featured number:
      - odd number
      - multiple of 7
      - digits occur exactly once each
    - return the next featured number that is greater than the argument.
    - Issue an error message if there is no next featured number.
    - There is no featured number greater than 9_999_999_999

- Test cases
  - Covered by examples

- Algorithm => OUTDATED
  Method `featured?`, args: `number`
    - 
  Method `featured`, args: `number`
    - Assign error message String to `ERROR`
    - Assign 9_999_999_999 to `LIMIT`
    - if `number` is odd
      - assign `number` to `current_number`
    - else
      - assign (`number` + 1) to `current_number`
    - loop
      - call `featured?` with `current_number`. If true
        - return `current_number`
      - else
        - increment `current_number` by 7
        - break if `current_number` is greater than
    - Return ERROR

- Code
=end

require 'pry'

LIMIT = 9_999_999_999
ERROR = "There is no possible number that fulfills those requirements"

def first_odd_multiple(input)
  number = input + 1

  until number.odd? && number % 7 == 0
    number += 1
  end

  number
end

def unique_digits?(number)
  number.to_s.chars.size == number.to_s.chars.uniq.size
end

def featured(number)
  current_number = first_odd_multiple(number)

  loop do
    return current_number if unique_digits?(current_number)
    
    current_number += 14
    
    break if current_number > LIMIT
  end

  ERROR
end


puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
