=begin
Palindromic Substrings

Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged
in the same sequence as the substrings appear in the string. Duplicate
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous
exercise.

For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
"Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

- Understand the problem
  - Input
    - String
  - Output
    - Array of of all substrings of original string that are palindromic
  - Rules
    - The return value should be arranged in the same sequence as the
      substrings appear in the string
    - Duplicate palindromes should be included multiple times.
    - Consider all characters and pay attention to case
    - Single characters are not palindromes

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

  Method: palindromes
    1. Assign empty Array to `palindromes`
    2. Call `substrings` method with `input_string` and assign to `substrings`
    3. Iterate over `substrings`
      - if current `substring` is a single character
        - do nothing
      - elsif current `substring` is palindrome
          - add `substring` to `palindromes`
    4. Return `palindromes`

  Method: palindrome?
    1. Compare if `input_string` is equal to reversed `input_string`

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

def palindrome?(input_string)
  input_string == input_string.reverse
end

def palindromes(input_string)
  palindromes = []
  substrings = substrings(input_string)
  
  substrings.each do |substring|
    palindromes << substring if palindrome?(substring) && substring.size != 1
  end

  palindromes
end

puts palindrome?('madam') == true
puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
