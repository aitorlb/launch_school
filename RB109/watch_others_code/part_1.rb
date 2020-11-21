=begin
Given a non-empty string check if it can be constructed by taking a substring
of it and appending multiple copies of the substring together. You may assume
the given string consists of lowercase English letters only.

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaad") == true
p repeated_substring_pattern("abcabcabcabc") == true

- Understand the problem
  - Input
    - String
  - Output
    - true/false
  - Rules
    - input sting is non-empty
    - input string consists of lowercase English letters only
    - check if input string can be constructed by taking a substring
      of it and appending multiple copies of the substring together

- Test cases
  - Well covered by examples.

- Algorithm
  Method `repeated_substring_pattern`, args: `string`
    - iterate from 0 up to `halfpoint`
      - slice `string` from beginning up to `index`
        and assign to `substring`
      - delete all appearences of `substring` in `string`
        and assign to `replaced_string`
      - if call to `repeated_substring_pattern` with `string` and `substring`
        returns true
        - return true
      - else
        - do nothing (next)
    - return false
  
  Method `repeated_substring_pattern?`, args: `string`, `substring`
  - while `string` includes `substring`
    - slice `string` from beginning up to `substring` size - 1
      and assign to `sliced_string`
    - if `sliced_string` is eq to `substring`
      - slice `string` from `substring` size and reassign to `string`
  - return string.empty?

- Code
=end

require "pry"

# def repeated_substring_pattern?(string, substring)
#   while string.include?(substring)
#     sliced_string = string[0..(substring.size - 1)]

#     if sliced_string == substring
#       string = string[substring.size..-1]
#     else
#       break
#     end
#   end

#   string.empty?
# end

# def repeated_substring_pattern(string)
#   halfpoint = (string.size - 1) / 2
  
#   0.upto(halfpoint) do |index|
#     substring = string[0..index]

#     return true if repeated_substring_pattern?(string, substring)
#   end

#   false
# end


def repeated_substring_pattern(string)
  halfpoint = (string.size - 1) / 2
  
  0.upto(halfpoint) do |limit|
    substring = string[0..index]

    return true if string.gsub(substring, "").empty?
  end

  false
end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
