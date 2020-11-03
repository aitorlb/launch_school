=begin
All Substrings

Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned
in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the
previous exercise:

Examples:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

- Understand the problem
  - Input
    - String
  - Output
    - Array of of all substrings of original string
  - Rules
    - The returned list should be ordered by where in the string the substring
      begins
    - the substrings at a given position should be returned in order from
      shortest to longest

- Examples
  - Covered

- Algorithm
  Method: leading_substrings
    1. Assign empty Array to `substrings`
    2. Iterate over `input_string`
      - Slice `input_string` up to `current_index`
      - Add sliced string to `substrings`
    3. Return `substrings` sorted

  Method: substrings
    1. Assign empty Array to `substrings`
    2. Iterate over `input_string`
      - Slice `input_string` from `current_index` up to the end
      - call `leading_substrings` method with sliced string
      - Add return value to `substrings`
    3. Return `substrings`

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

def substrings(input_string)
  substrings = []

  input_string.chars.each_with_index do |_, index|
    substring = input_string[index..-1]
    substrings += leading_substrings(substring)
  end

  substrings
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
