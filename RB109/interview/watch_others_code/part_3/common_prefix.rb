=begin
Write a method to find the longest common prefix string amongst an array of 
strings.

If there is no common prefixm return an empty string "".

Examples:

common_prefix(["flower","flow","flight"]) == "fl"
common_prefix(["dog","racecar","car"]) == ""
common_prefix(["interspecies","interstellar","interstate"]) == "inters"
common_prefix(["throne","dungeon"]) == ""
common_prefix(["throne","throne"]) == "throne"

All given inputs are in lowercase letters a-z.

- Understand the problem
  - Input: Array of String elements
  - Output: String
  - Rules
    - All given inputs are in lowercase letters a-z.
    - Find the longest common prefix string amongst input strings.
    - If there is no common prefixm return an empty string "".

- Test cases
  - Well covered by examples.

- Mental model
  - find shortest word in array and save its size
  - iterate shortest_word_size and compare characters
  - if they are all the same append character to result
  - break loop when character is different
  - return result

- Algorithm
  Method: `common_prefix`, args: `strings`
    - Assign empty String to `result`
    - find shortest word in `strings` and assign to `shortest_str`
    - initialize Array from 0 to (`shortest_str` - 1) size to `indexes`
    - iterate over `indexes` as `idx`
      - iterate over `strings` as `str`
        - assign `str` element at index `idx` to `current_char`
        - if `result` size is eq to `idx`
          - append `current_char` to `result`
          - continue to next iteration
        - else
          - assign `result` element at index `idx` to `last_char`
        - if `current_char` is eq to `last_char`
          - continue to next iteration
        - else
          - pop last element from `result`
          - stop iterating
      - return `result`

- Code
=end

def common_prefix(strings)
  result = ""
  shortest_str = strings.sort_by { |str| str.size }.first
  indexes = (0..shortest_str.size - 1).to_a

  indexes.each do |idx|
    strings.each do |str|
      current_char = str[idx]

      if result.size == idx
        result[idx] = current_char
        next
      else
        last_char = result[idx]
      end

      if current_char == last_char
        next
      else
        result = result[0..-2]
        return result
      end
    end
  end

  result
end

p common_prefix(["flower","flow","flight"]) == "fl"
p common_prefix(["dog","racecar","car"]) == ""
p common_prefix(["interspecies","interstellar","interstate"]) == "inters"
p common_prefix(["throne","dungeon"]) == ""
p common_prefix(["throne","throne"]) == "throne"
