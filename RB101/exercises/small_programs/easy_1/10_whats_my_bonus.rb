# What's my Bonus?
# Write a method that takes two arguments, a positive integer and a boolean, and
# calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.

# Examples:

# puts calculate_bonus(2800, true) == 1400    #=> true
# puts calculate_bonus(1000, false) == 0      #=> true
# puts calculate_bonus(50000, true) == 25000  #=> true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def calculate_bonus(number, bonus)
  bonus ? (number / 2) : 0
end

assert_equal(1400, calculate_bonus(2800, true))
assert_equal(0, calculate_bonus(1000, false))
assert_equal(25000, calculate_bonus(50000, true))

# LS Solution
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end
