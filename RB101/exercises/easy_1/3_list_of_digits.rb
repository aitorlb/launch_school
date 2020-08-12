# List of Digits

# Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# First Solution
def digit_list(integer)
  integer.to_s.split("").map(&:to_i)
end

# Test cases
assert_equal(digit_list(12345), [1, 2, 3, 4, 5])
assert_equal(digit_list(7), [7])
assert_equal(digit_list(375290), [3, 7, 5, 2, 9, 0])
assert_equal(digit_list(444), [4, 4, 4])

# LS Solution: Brute force
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

# LS Solution: Idiomatic Ruby
def digit_list(number)
  number.to_s.chars.map(&:to_i)
end
