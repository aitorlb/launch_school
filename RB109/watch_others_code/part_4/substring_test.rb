=begin
Given 2 strings, your job is to find out if there is a substring that appears
in both strings. You will return true if that is the case and false otherwise.
We only care about substrings that are longer than one letter long.

substring_test("Something", "Fun") == false
substring_test("Something", "Home") == true   # "me"
substring_test("Something", "") == false      # empty
substring_test("", "Something") == false
substring_test("BANANA", "banana") == true    # case insensitive?
substring_test("test", "lllt") == false
substring_test("", "") == false
substring_test("1234567", "541265") == false  # "12"
substring_test("supercalifragilisticexcpialidocious", "SoundOfItIsAtrociou")
  == true # "ociou"

- Understand the problem
  - Input: 2 String
  - Output: true/false
  - Rules
    - Return true if there is a substring that appears in both strings
    - Only care about substrings that are longer than one letter long
    - Input String can be empty
    - Ignore case and characters that are not letters a-z

- Test cases
  - Well covered by examples.

- Mental model
  - downcase both strings
  - find shortest string
  - iterate over shortest string size
  - take 2 characters at a time and see if they are present in the other string

- Algorithm
  Method: `substring_test`, args: `srt1`, `srt2`
    - downcase both `srt1` and `srt2`
    - find shortest String and assign to `short_str`
    - find shortest String and assign to `long_str`
    - assign Array of number 0 to (`short_str` size - 2) and assign to `indexes`
    - iterate over `indexes` as `idx`
      - slice `short_str` from `idx` to `idx` + 1 (two characters) and assign
        to `substr`
      - if call to `all_letters?` with `substr` returns false
        - continue iterating
      - else
        - if `substr` is in `long_str`
          - return true
        - else
          - continue iterating
    - return false

  Method: `all_letters?`, args: `str`
    - Assign Array of letters a-z to `LETTERS`
    - if `str` contains a character other than letters a-z
      - return false
    - else
      - return true

- Code
=end

LETTERS = ("a".."z").to_a

def all_letters?(str)
  str.chars.all? { |char| LETTERS.include?(char) }
end

def substring_test(srt1, srt2)
  short_str, long_str = [srt1, srt2].map(&:downcase).sort_by { |str| str.size }
  indexes = (0..short_str.size - 2).to_a

  indexes.each do |idx|
    substr = short_str[idx..idx + 1]

    next unless all_letters?(substr)

    return true if long_str.include?(substr)
  end

  false
end

p substring_test("Something", "Fun") == false
p substring_test("Something", "Home") == true   # "me"
p substring_test("Something", "") == false
p substring_test("", "Something") == false
p substring_test("BANANA", "banana") == true    # banana
p substring_test("test", "lllt") == false
p substring_test("", "") == false
p substring_test("1234567", "541265") == false  # "12"
srt1 = "supercalifragilisticexcpialidocious"
srt2 = "SoundOfItIsAtrociou"
p substring_test(srt1, srt2) == true            # "ociou"
