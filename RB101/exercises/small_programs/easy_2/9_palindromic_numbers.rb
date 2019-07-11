# Palindromic Numbers

# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

def palindrome?(string)
  string.reverse == string
end

# First Solution
def palindromic_number?(number)
  palindrome?(number.to_s)
end

assert_equal(true, palindromic_number?(34543))
assert_equal(false, palindromic_number?(123210))
assert_equal(true, palindromic_number?(22))
assert_equal(true, palindromic_number?(5))

# LS Solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end