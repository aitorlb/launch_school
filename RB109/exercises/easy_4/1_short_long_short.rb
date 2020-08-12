=begin
Short Long Short
Write a method that takes two strings as arguments, determines the longest
of the two strings, and then returns the result of concatenating the shorter string,
the longer string, and the shorter string once again. You may assume that the
strings are of different lengths.

Examples:

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

1. Understand the problem
- input
  - 2 strings of different lengths
- output
  - 1 string
  - concatenate short string + long string + short string (again)

2. Test cases
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
short_long_short('AA', 'b') == "bAAb"

3. Describe your algorithm
- identify which string is shorter/longer
- return shorter + longer + shorter

4. Begin coding
=end

def short_long_short(str_a, str_b)
  short, long = [str_a, str_b].sort_by(&:size)
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
puts short_long_short('AA', 'b') == "bAAb"