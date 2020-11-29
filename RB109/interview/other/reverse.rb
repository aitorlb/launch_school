=begin
Create a method that reverses digits in a string but keeps letter characters in their current order.

Examples:

p reverse("ab89c") == "ab98c"
p reverse("jkl5mn923o") == "jkl3mn295o"
p reverse("123a45") == "543a21"

The tests above should print "true".

- Understand the problem
  - Input: String
  - Output: String
  - Rules:
    - Reverse digits in input string but keeps letter characters in their original order.
    - If String is empty return empty String.
    - If String contains only characters return original String.

- Test cases
 - p reverse("abc") == "abc"

- Mental model
  - iterate through input string
  - do nothing if characters is a english letter
  - store digits in array
  
  - iterate through input string
  - do nothing if characters is a english letter
  - replace digit by last element of saved digits

- Algorithm
  Method: `letter?`, args: `char`
    - if downcased `char` is in letters from (a-z)
      - return true
    - else
      - return false

  Method: `reverse`, args: `str`
    - assign empty Array to `digits`
    - assign empty Array to `reversed_chars`
    - split `str` into characters and assign to `chars`
    - iterate through `chars` as `char`
    - if `char` is a letter character
      - continue iterating
    - else # asume digit
      - add `char` to `digits`
    - iterate through `chars` as `char`
    - if `char` is a letter character
    - if `char` is a letter character
      - add `char` to `reversed_chars`
    - else # asume digit
      - pop last element of `digits` and add it to `reversed_chars`
    - return `reversed_chars` joined as String
      

- Code
=end

def letter?(char)
  ("a".."z").to_a.include?(char)
end

def reverse(str)
  digits         = []
  reversed_chars = []
  chars          = str.chars
  
  chars.each do |char|
    digits << char unless letter?(char)
  end
  
  chars.each do |char|
    if letter?(char)
      reversed_chars << char
    else
      reversed_chars << digits.pop
    end
  end
  
  reversed_chars.join
end

p reverse("abc") == "abc"
p reverse("ab89c") == "ab98c"
p reverse("jkl5mn923o") == "jkl3mn295o"
p reverse("123a45") == "543a21"

# Refactoring

LETTERS = ("a".."z").to_a

def letter?(char)
  LETTERS.include?(char)
end

def digits(chars)
  chars
    .reject { |char| letter?(char) }
end

def reverse(str)
  chars          = str.chars
  digits         = digits(chars)
  reversed_chars = []
  
  chars.each do |char|
    if letter?(char)
      reversed_chars << char
    else
      reversed_chars << digits.pop
    end
  end
  
  reversed_chars.join
end
  
p reverse("abc") == "abc"
p reverse("ab89c") == "ab98c"
p reverse("jkl5mn923o") == "jkl3mn295o"
p reverse("123a45") == "543a21"

=begin

Interviewer feedback:
  - You think in silence and code out loud.
  - You should vocalize your intentions so the interviewer can follow your though process.

=end
