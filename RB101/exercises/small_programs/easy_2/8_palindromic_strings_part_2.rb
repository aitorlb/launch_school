# Palindromic Strings (Part 2)

# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters.
# If you wish, you may simplify things by calling the palindrome? method you
# wrote in the previous exercise.

# Examples:

# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false

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
def real_palindrome?(string)
  alphanumeric = ('a'..'z').to_a + (0..9).to_a
  filtered_string = string.downcase.chars.select { |e| alphanumeric.include?(e) }.join
  palindrome?(filtered_string)
end

assert_equal(true, real_palindrome?('madam'))
assert_equal(true, real_palindrome?('Madam'))
assert_equal(true, real_palindrome?("Madam, I'm Adam"))
assert_equal(true, real_palindrome?('356653'))
assert_equal(true, real_palindrome?('356a653'))
assert_equal(false, real_palindrome?('123ab321'))

# LS Solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end