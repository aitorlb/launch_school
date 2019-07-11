# Reverse It (Part 1)

# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def reverse_sentence(sentence)
  sentence.split.reverse.join(" ")
end

assert_equal(reverse_sentence(''), '')
assert_equal(reverse_sentence('Hello World'), 'World Hello')
assert_equal(reverse_sentence('Reverse these words'), 'words these Reverse')

# LS Solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
