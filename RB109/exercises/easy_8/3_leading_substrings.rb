=begin
Leading Substrings

Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

Examples:

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

- Understand the problem
  - Input
    - String
  - Output
    - Array of substrings starting at the beginning of the original string
  - Rules
    - The return value should be arranged in order from shortest to longest.

- Examples
  - Covered

- Algorithm
  1. Assign empty Array to `substrings`
  2. Iterate over `input_string`
    - Slice `input_string` up to `current_index`
    - Add sliced string to `substrings`
  3. Return `substrings` sorted

- Code
=end

def leading_substrings(input_string)
  substrings = []

  input_string.chars.each_with_index do |_, index|
    substrings << input_string[0..index]
  end

  sorted_substrings = substrings.sort_by { |s| s.length }

  sorted_substrings
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
