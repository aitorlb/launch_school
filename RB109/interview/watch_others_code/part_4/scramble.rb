=begin
Write a function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.

Examples:

scramble("javaass", "jjss") == false
scramble("rkqodlw", "world") == true
scramble("cedewaraaossoqqyt", "codewars") == true
scramble("katas", "steak") == false
scramble("scriptjava", "javascript") == true
scramble("scriptingjava", "javascript") == true

Only lower case letters will be used (a-z). No punctuation or digits will be 
included.

- Understand the problem
  - Input: 2 Strings
  - Output: true/false
  - Rules:
    - Returns true if a portion of str1 can be rearranged to match str2, 
      false otherwise.
    - Only lower case letters will be used (a-z).

- Test cases
  - Well covered by examples.

- Mental model
  - check if str1 contains all characters from str2

- Algorithm
  Method: `scramble`, args: `str1`, `str2`
    - split `str1` into characters and assign to `str1_chars`
    - split `str2` into characters and assign to `str2_chars`
    - iterate over `str2_chars` as `char`
      - if `char` is present in `str1_chars`
        - remove 1 instance of `char` from `str1_chars`
        - continue iterating
      - else
        - return false
    - return true

- Code
=end

def scramble(str1, str2)
  str1_chars = str1.chars
  str2_chars = str2.chars

  str2_chars.each do |char|
    return false unless str1_chars.include?(char)

    index = str1_chars.index(char)
    str1_chars.delete_at(index)
  end

  true
end

p scramble("javaass", "jjss") == false
p scramble("rkqodlw", "world") == true
p scramble("cedewaraaossoqqyt", "codewars") == true
p scramble("katas", "steak") == false
p scramble("scriptjava", "javascript") == true
p scramble("scriptingjava", "javascript") == true
