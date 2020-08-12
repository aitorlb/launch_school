# Stringy Strings

# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'     #=> true
# puts stringy(9) == '101010101'  #=> true
# puts stringy(4) == '1010'       #=> true
# puts stringy(7) == '1010101'    #=> true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def stringy(num)
  string = "10" * (num / 2.0).ceil
  string.slice(0...num)
end

assert_equal('101010', stringy(6))
assert_equal('101010101', stringy(9))
assert_equal('1010', stringy(4))
assert_equal('1010101', stringy(7))

# LS Solution
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

# Further Exploration

# Modify stringy so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should
# return a String of alternating 0s and 1s, but starting with 0 instead of 1.

# Solution
def stringy(num, start = 1)
  repeating_string = start.to_s.concat(start.positive? ? "0" : "1")
  string = repeating_string * (num / 2.0).ceil
  string.slice(0, num)
end

assert_equal('101010', stringy(6))
assert_equal('010101', stringy(6, 0))
