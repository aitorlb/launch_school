# Reverse It (Part 2)

# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with all five or more letter words reversed. Each
# string will consist of only letters and spaces. Spaces should be included only
# when more than one word is present.

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# Tester method
def assert_equal(expected, actual)
  unless expected == actual
    puts "Assertion failed!"
    puts "Expected: #{expected.inspect}"
    puts "Actual: #{actual.inspect}"
  end
end

# Solution
def reverse_words(sentence)
  sentence.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end.join(" ")
end

assert_equal(reverse_words('Professional'), "lanoisseforP")
assert_equal(reverse_words('Walk around the block'), "Walk dnuora the kcolb")
assert_equal(reverse_words('Launch School'), "hcnuaL loohcS")

# LS Solution
def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end
