=begin
Given an array of strings made only from lowercase letters, return an array of 
all characters that show up in all strings within the given array (including 
duplicates). For example, if a character occurs 3 times in all strings but not 
4 times, you need to include that character three times in the finak answer.

p common_chars(["bella", "label", "roller"]) == ["e","l","l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee","ggrrrrr","yyyzzz"]) == []

- Understand the problem
  - Input
    - Array of Strings
  - Output
    - Array of Strings
  - Rules
    - Sring elements in input Array are made only from lowercase letters
    - ouput Array must contain all characters that show up in all strings
    - characters that show up n times in all strings must appear in ouput
      Array n times.

- Test cases
  - Well covered by provided examples.

- Algortithm
  Method: `common_chars`, args: `strings_arr`
    - assign [] to `result`
    - assign `strings_arr` with strings splitted into chars to 
      `string_chars_arr`
    - assign first element in `string_chars_arr` to `first_word_chars`
    - iterate over `first_word_chars` as `char`
      - assign [] to `ocurrences_arr`
      - iterate over `string_chars_arr` as `string_chars`
        - count how many times `char` appears in `string_chars` and append to
          `ocurrences_arr`
      - sort `ocurrences_arr` and assign first element to
        `lowest_common_occurence_count`
      - if `lowest_common_occurence_count` is eq to 0
        - continue to next iteration
      - else
        - `lowest_common_occurence_count` times add `char` to `result`
    - return `result`

- Code
=end

def lowest_common_char_count(strings_arr, char)
  strings_arr
    .map { |string| string.count(char) }
    .sort
    .first
end

def common_chars(strings_arr)
  result = []
  first_str_uniq_chars = strings_arr.first.chars.uniq

  first_str_uniq_chars.each do |char|
    lowest_common_char_count = lowest_common_char_count(strings_arr[1..], char)

    next if lowest_common_char_count.zero?

    result += Array.new(lowest_common_char_count, char)
  end

  result
end

p common_chars(["bella", "label", "roller"]) == ["e","l","l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee","ggrrrrr","yyyzzz"]) == []
