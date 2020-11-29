=begin
Understand problem
  - input: string
    - empty or not
  - output: boolean
    - return true if isogram
  - rules
    - isogram: word with no repeating letters, consecutive or not.
    - assume empty string is isogram
    - ignore case letters

Test cases
  - well covered by examples.

Describe algorithm
  - Iterate over chars in string
    - count ocurrences of given char in string
    - if total ocurrences is greater than one 
      - return false
    - do nothing
  - return true
  
Begin coding
=end

def is_isogram(string)
  chars = string.downcase.chars
  chars.all? {|c| chars.count(c) == 1 }
end
