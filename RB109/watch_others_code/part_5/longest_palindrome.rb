=begin
Find the length of the longest substring in the given string that is the same 
in reverse.

Examples: 

longest_palindrome("a") == 1 # "a"
longest_palindrome("aa") == 2 # "a"
longest_palindrome("baa") == 2 # "aa"
longest_palindrome("aab") == 2 # "aa"
longest_palindrome("baabcd") == 4 # "baab"
longest_palindrome("baablkj12345432133d") == 9 # "123454321"

If the length of the input string is 0, the return value must be 0.

- Understand the problem
  - Input: String
  - Ouput: Integer
  - Rules:
    - Find the length of the longest palindrome substring in the given string.
    - If the length of the input string is 0, the return value must be 0.

- Test cases
  - longest_palindrome("") == 0
  - longest_palindrome("abc") == 1

- Mental model
  - Find all substrings
  - Keep palindrome substrings
  - Find longest substring
  - Return length of substring

- Algorithm
  Method: `palindrome?`, args: `str`
    - compare `str` to reverse of `str`

  Method: `longest_palindrome`, args: `str`
    - assign empty Array to `palindromes`
    - assign Array of numbers from 0 to (`str` size -1) to `start_indexes`
    - iterate over `start_indexes` as `start_idx`
      - assign Array of numbers from `start_idx` to (`str` size -1) to 
        `end_indexes`
      - iterate over `end_indexes` as `end_idx`
      - slice `str` from `start_idx` to `end_idx` and assign to `substring`
      - if call `palindrome?` with `substring` returns true
        - add `substring` to `palindromes`
      - else
        - continue iterating
    - sort `palindromes` by element size, get last and assign to
      `longest_palindrome`
    - return `longest_palindrome` size  

- Code
=end

def palindrome?(str)
  str == str.reverse
end

def longest_palindrome(str)
  palindromes = []

  start_indexes = (0...str.size).to_a

  start_indexes.each do |start_idx|
    end_indexes = (start_idx...str.size).to_a

    end_indexes.each do |end_idx|
      substring = str[start_idx..end_idx]

      palindromes << substring if palindrome?(substring)
    end
  end

  longest_palindrome = palindromes.sort_by(&:size).last
  
  longest_palindrome.size
end

p palindrome?("a") == true # "a"
p longest_palindrome("a") == 1 # "a"
p longest_palindrome("aa") == 2 # "a"
p longest_palindrome("baa") == 2 # "aa"
p longest_palindrome("aab") == 2 # "aa"
p longest_palindrome("baabcd") == 4 # "baab"
p longest_palindrome("baablkj12345432133d") == 9 # "123454321"
