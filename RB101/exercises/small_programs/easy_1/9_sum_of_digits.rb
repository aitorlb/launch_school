# Sum of Digits

# Write a method that takes one argument, a positive integer,
# and returns the sum of its digits.

# Examples:

# puts sum(23) == 5           #=> true
# puts sum(496) == 19         #=> true
# puts sum(123_456_789) == 45 #=> true

# For a challenge, try writing this without any basic looping
# constructs (while, until, loop, and each).

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def sum(number)
  number.to_s.chars.map(&:to_i).inject(:+)
end

assert_equal(5, sum(23))
assert_equal(19, sum(496))
assert_equal(45, sum(123_456_789))

# LS Solution 1
def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

# LS Solution 2
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end
