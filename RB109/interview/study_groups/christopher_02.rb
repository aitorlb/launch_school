=begin
Task:

In this simple Kata your task is to create a function that turns a string into 
a Mexican Wave. You will be passed a string and you must return that string in 
an array where an uppercase letter is a person standing up. 

Rules
 1. The input string will always be lower case but maybe empty.
 2. If the character in the string is whitespace then pass over it as if it 
    was an empty seat.

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

- Understand the problem
  - Input: String
  - Output: Array of String elements
  - Rules:
    - Input string will always be lower case but maybe empty.
    - Whitespace should be ignored
    
- Test cases
  - Covered by example.

- Algorithm
  Method `wave`, args: `str`
    - Assign Array of (str.length) length of `str` elements to `wave`
    - transform `wave` as `word` with index as `idx`
      - split `word` into characters and assign to `chars`
      - assign uppercase character in `chars` at `chars` index `idx`
      - join `chars`

- Code
=end

def wave(str)
  wave = []

  str.size.times do |idx|
    chars      = str.chars
    chars[idx] = chars[idx].upcase
    
    wave << chars.join
  end

  wave
end

def wave(str)
  wave = Array.new(str.size, str)

  wave.map.with_index do |word, idx|
    chars      = word.chars
    chars[idx] = chars[idx].upcase
    chars.join
  end
end

def wave(str)
  Array.new(str.size, str)
    .map
    .with_index do |word, idx|
      chars      = word.chars
      chars[idx] = chars[idx].upcase
      chars.join
    end
end

def wave(str)
  arr =
    str
    .size
    .times
    .map { str.dup }

  arr
    .map
    .with_index do |word, idx|
      word[idx] = word[idx].upcase
      word
    end
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
