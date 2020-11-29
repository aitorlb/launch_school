=begin
Problem:

Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Examples:

alphabetized("The Holy Bible") # "BbeehHilloTy"

- Understand the problem
  - Input: String
  - Output: String
  - Rules:
    - The input contains only english alphabet letters, including spaces.
    - Whitespace and punctuation shall simply be removed.
    - Output string should be reordered:
      - case insensitive
      - alphabetically

- Test cases
  - Well covered by examples

- Algorithm
  - assign lowercase alphabet letters to `ALPHABET`

  Method `alphabetized`, args: `str`
    - assign [] to `result`
    - split `str` into characters and assign to `chars`
    - iterate through `chars` as `char`
      - if `char` lowercase is in `ALPHABET`
        - add `char` to `result`
      - else
        - continue next iteration
    - return `result` joined as a String
    
- Code
=end

ALPHABET = ("a".."z").to_a

def alphabetized(str)
  str
    .chars
    .select  { |char| ALPHABET.include?(char.downcase) }
    .sort_by { |char| char.downcase }
    .join
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"

=begin
Notes from interviewer:
  - Speak louder
  - Read the problem carefully
  - Pay attention to examples
  - Focus on the algorithm

Notes to self:
  - Don't method hunt
  - Don't refactor in place, leave working method alone and create a new one
=end
