# Palindromic Strings (Part 1)

# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# First Solution
def palindrome?(string)
  string.reverse == string
end

assert_equal(true, palindrome?('madam'))
assert_equal(false, palindrome?('Madam'))
assert_equal(false, palindrome?("madam i'm adam"))
assert_equal(true, palindrome?('356653'))

# LS Solution
def palindrome?(string)
  string == string.reverse
end