# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello

# First Solution
def repeat(string, integer)
  raise 'Integer must be positive' unless integer.positive?

  puts "#{string}\n" * integer
end

repeat('Hello', 3)

# LS Solution
def repeat(string, number)
  number.times do
    puts string
  end
end

# Refactored solution
def repeat(string, number)
  number.times { puts string }
end
