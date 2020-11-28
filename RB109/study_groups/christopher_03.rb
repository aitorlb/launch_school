=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

- Understand the problem
  - Input: String
  - Output: Integer
  - Rules:
    - return the number of odd-numbered substrings that can be formed
    - substrings are have to be consecutive characters

- Test cases
  - Well covered.
  
- Mental model
  - Find all substrings
  - Check how many of them are odd-numbered

- Algorithm
  Method: `solve`, args: `str`
    - assign 0 to `odd_substr_count`
    - assign Array of numbers from 0 to (`str` size -1) to `outer_indexes`
    - iterate over `outer_indexes` as `start_idx`
      - assign Array of numbers `start_idx` to (`str` size -1) to `inner_indexes`
      - iterate over `inner_indexes` as `end_idx`
        - slice `str` from `start_idx` to the `end_idx` and assign to `substr`
        - cast `substr` to integer and assign to `number`
        - if `number` is odd
          - increment `odd_substr_count`
        - else
          - continue iteration
    - return `odd_substr_count`

- Code
=end

def solve(str)
  odd_substr_count = 0
  
  outer_indexes = (0..str.size - 1).to_a
  
  outer_indexes.each do |start_idx|
    inner_indexes = (start_idx..str.size - 1).to_a
    
    inner_indexes.each do |end_idx|
      substr = str[start_idx..end_idx]
      
      odd_substr_count += 1 if substr.to_i.odd?
    end
  end
  
  odd_substr_count
end
  
p solve("1341") == 7 # 1, 1, 3, 13, 41, 341, 1341
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

=begin

Interviewer feedback:
  - Choose clearer variables names, i.e. from `inner_indexes` to `satr_indexes` 
  - explain what you're doing in a higher level during the algorithm,
    don't go into detail without explaining what it is that you're trying to accomplissh

Christopher solution:

Algorithm2
1. create an array to put the substrings
2. find the substrings
  create a nested loop with purpose to collect substrings
    outer loop iterates over the string start index, from idx 0 to end of substring
      inner loop iterates over lengths, from length 1 to max length
      - max length is function of current start index
      - lengths is from 1 to (string size - start index)
3. put current substring into array if substring converted to integer is odd 
4. RETURN the number of elements in the array

def solve(str)
  substrings = []
    str.chars.each_index do |s_idx|
      1.upto(str.size-s_idx).each do |len|
        p s_idx
        p len
        slice = str[s_idx, len]
        p slice
        substrings << slice if slice.to_i.odd?
      end
    end
  substrings.count
end

=end
