# Array Average

# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be empty
# and the numbers will always be positive integers.

# Examples:

# puts average([1, 5, 87, 45, 8, 8]) == 25      #=> true
# puts average([9, 47, 23, 95, 16, 52]) == 40   #=> true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def average(array)
  array.reduce(:+) / array.length
end

assert_equal(25, average([1, 5, 87, 45, 8, 8]))
assert_equal(25, average([9, 47, 23, 95, 16, 52]))
assert_equal(Integer, average([9, 47, 23, 95, 16, 52]).class)

# LS Solution
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

# Further Exploration

# Currently, the return value of average is an Integer. When dividing numbers,
# sometimes the quotient isn't a whole number, therefore, it might make more
# sense to return a Float. Can you change the return value of average from an
# Integer to a Float?

# Solution
def average(numbers)
  sum = numbers.reduce(:+)
  average = sum / numbers.count.to_f
  average.round(2)
end

assert_equal(Float, average([9, 47, 23, 95, 16, 52]).class)
